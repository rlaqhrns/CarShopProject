function setDisplay(){
    console.log("실행된다!!");

    let $front = $("#front_parts");
    let $side = $("#side_parts");
    let $rear = $("#rear_parts");
    let $etc = $("#etc");
    let $engine = $("#engine_lower_body");
    $(".front_parts").hide(); // 프론트 파츠 클래스(radio) 숨기기
    $(".side_parts").hide(); // 프론트 파츠 클래스(radio) 숨기기
    $(".rear_parts").hide(); // 프론트 파츠 클래스(radio) 숨기기
    $(".etc").hide(); // 프론트 파츠 클래스(radio) 숨기기
    $(".engine_lower_body").hide(); // 프론트 파츠 클래스(radio) 숨기기
    
    if($front.is(':checked')){ // 전면부품 체크시 
        $(".front_parts").show(); // 프론트 파츠 클래스(radio) 보이기
    }                     // 전면부품이 체크 안되어있을때
    
    if($side.is(':checked')){ // 전면부품 체크시 
        $ (".side_parts").show(); // 프론트 파츠 클래스(radio) 보이기
    }
    if($rear.is(':checked')){ // 전면부품 체크시 
        $(".rear_parts").show(); // 프론트 파츠 클래스(radio) 보이기
    }
    if($etc.is(':checked')){ // 전면부품 체크시 
        $(".etc").show(); // 프론트 파츠 클래스(radio) 보이기
    }
    if($engine.is(':checked')){ // 전면부품 체크시 
        $(".engine_lower_body").show(); // 프론트 파츠 클래스(radio) 보이기
    }

}