<?php
include_once 'conn.php';
include_once '../model/Category.php';
include_once '../model/Voucher.php';
include_once '../model/Category.php';

function Get_voucher_discount_by_code($voucherCode){
global $pdo;
$query = $pdo->prepare("SELECT discountValue FROM voucher WHERE code = $voucherCode");
    try{
        $query->execute();    
        $result = $query->fetch();
        $voucher = $result['discountValue'];
        return $voucher;  
    }catch (Exception $e){
        return 0;
    }
}
function Get_voucher_id_by_code($voucherCode){
    global $pdo;
    $query = $pdo->prepare("SELECT discountValue FROM voucher WHERE code = $voucherCode");
        try{
            $query->execute();    
            $result = $query->fetch();
            $voucher = $result['discountValue'];
            return $voucher;  
        }catch (Exception $e){
            return 0;
        }
    }
    function Create_Bill($bill) {
        global $pdo;
    
        $query = $pdo->prepare("INSERT INTO `bill` (`id`, `email`, `address`, `phone`, `content`, `totalAmount`, `discountAmount`, `finalAmount`, `idUser`, `idVoucher`, `dateCreated`) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp())");
        try {
            // Thực thi truy vấn với các giá trị từ $bill
            $query->execute([
                $bill->get_ID(),
                $bill->get_Email(),
                $bill->get_Address(),
                $bill->get_Phone(),
                $bill->get_Content(),
                $bill->Get_TotalAmount(),
                $bill->Get_DiscountAmount(),
                $bill->Get_FinalAmount(),
                $bill->Get_IdUser(),
                $bill->Get_IdVoucher()
            ]);
    
            // Trả về ID của bản ghi vừa thêm (nếu cần)
            return $pdo->lastInsertId();
        } catch (Exception $e) {
            // Log lỗi nếu cần thiết
            error_log("Error inserting bill: " . $e->getMessage());
            return $e->getCode();
        }
    }
    
?>