Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655533932F9
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 04:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138450; cv=none; b=qnJ+wv1Cf/m6VtAu5jeLsVdGksRSw8xud8PxruXdYJQFZqyiEwXNt8CozinUwszkX5GZUiX159py5TvLaSKR4FLjMvOX6Okkqre2heWmejXLwyYQDaBzNRcYPquOL9FKD++K0usQkx9bzb30TnBMOcN1yeKdPvgjQPefRda/6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138450; c=relaxed/simple;
	bh=VPyV7a3xkDcgrm9q8NZfLDEhH7ky+H3tTw4yjI/sfoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4p9JZC6ViUwZhXc3S6h/b0itePQEoo3xucyICqbq75KIRo0CHTnXlhp1ktVD6e23XGTG8tCucdUG3BX5Zjr9YWNwC4SbqcIQFLZsJgM2KeOBXqlyPOO7au3M7fp8GnaIJH2HgyEcCLjJgFUWlQfss8ZtQdD3+jg8MXO/NYj92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wg3MTmL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrfYdjc0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wg3MTmL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrfYdjc0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ieTN1986382
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 04:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adnXMOlaGdiVvNccfQEuf1IxL8hL39dpJ1d6HYQXyVw=; b=Wg3MTmL/7eB7QUZx
	P+tayauqoJw7YlEL3+MSt9QlCjFkHTTZBeQXmzR8GjdyJKTtUQSDUqC2GULp11Ar
	G3yIs0J+B4Wg74DeK4sYU9HINcmIyivfiY6eOHBmycfqNrT1cbra+3UwnOg6VEFi
	OAQ+kctCe4l3MAJJQvi9uaCnQOZm/NYonTzDKHqBYs58yAiEToBtclXcZxqg1FsV
	va+zNgy/17EAUmb1bBi0Vkd7muk1q2MO2zBoemaMo4zRYcBZhLtmrPzcc5Ly4Hx/
	v4eFRNrILUutyyWELrdBAsZvDF+tnA6O5ZSitFA7oiGForrEj1PeONO7LSX/Er3J
	CuKurQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv33190ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 04:40:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1398808c88.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 21:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790138447; x=1790743247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adnXMOlaGdiVvNccfQEuf1IxL8hL39dpJ1d6HYQXyVw=;
        b=ZrfYdjc0fCdHfsZSlmJmkkYNtZDB/LaTAS5wWRA41QQqjVbaW9qg0hsaZ6YES8/kAl
         /iUFCWrALaS3XVrfMJYqUC2ilfR/hoDE9j1jRDun0sjPajWqDjcjckCN8EBh61IPzlgq
         ubQfOzcxx/5FUPVwjezMdszMeHw8waWFukWh5/Oswo4D3GWVqV1A4810TH+Oz5MTSSV3
         NYjM2MnHlIOtZHRqIFm7zER0Hp/mlZXow8NyCnEjB9nyuRhr8hjKbz78R1G2GiUkOQKM
         pWXpiZrPSiEf73nRo4Ll5U+FkyVNsp3EZja+0zhI2pnEMkmCXSYSpjgrBhGfrsFKcrux
         eeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790138447; x=1790743247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adnXMOlaGdiVvNccfQEuf1IxL8hL39dpJ1d6HYQXyVw=;
        b=mvtd4E8yeH1cnnuoMhNVKMfxZ1owLmL0QYshUaFq3tT4orGtjLabpSoPtMhkxdnSGs
         uSVaand3VDOsIG99ktsQu7eBJjRylS6AC0WDKrsw6FsiJK5akmTzlCJyndE6AUpJkI4U
         jYZOzRfeQiVzIIvWGMP1YuHP5WaN0azmQcAo4m4weoqYwUzN7COSj5MjbyufSp2gMHe7
         XJCNAGjj7kMiEOLJ2e0CzwUbTDXBFgRtb2kRqZxlyTh9qdu593KMmyGO4vQAQ9Jo8aDc
         hZ92ChooF4zEZol569kvRhN6yUADo7lrGNJKVB98WhTgLPsm/DK2HmWwAVxFYWdNZ54j
         1rlg==
X-Forwarded-Encrypted: i=1; AKwUvBydCyxzJXfNZXuA6EgijGVYDQRwHJ2m9y0NHZpFIj6UJEDfP8ivlrAsAfXKBBX48JbCbeKOXsF9QB8=@vger.kernel.org
X-Gm-Message-State: AFuF++mhVftYH9XmCqD3D5ycQt2+2OwwTDsifMMRO0Bq3/Nhvide2Xzg
	PO0qukY0bwzlx1xymK25gSBfYngoaq1fQWCc5Akbs7QvK6C6+0AYIW1YGgH19Sl4NaSatF8s7TB
	eh9ELZdGF4FzqxPAErihK06ppM8kdXCikbFBvJD1pPixqLhc2YAls2L3eqBG6AdQ=
X-Gm-Gg: AYBFou0BXYravKbydt42N1jNoFztXW1HfHmsKvNbsHeaLx3N/HwWCXd2iqu/wHTkcuC
	n4E97sKYq1d+ZejT2RsB9Z/3VrIIdazt6KGGspZ6SHHTQgmhptO1A4DZxyXZVCta95te1UrIokg
	A9UlSvqzvy0YFMDH5UXzzuxMENornVlLtOkhBzQCUBeQU41MeWM3v+XhI7BUS+rXRmWP2XpIP09
	H/1Xip7hIPxGzpR7pugO5K2djBivGFubvsanflZEMItHCFH1SnEjTf+uX/LO10+A9++K7zY8H5w
	l8Yh28OnWt71nzQuufAd1SvDCzHf81SgZf4HEV2SMMJnGGHffVfoVsEcQkbdDzSTU09hgwW/xVA
	Kjcpdm0FlTUgGa3ZP+s6YWLy3BPQ3fQ==
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2614030c88.9.1790138446846;
        Tue, 22 Sep 2026 21:40:46 -0700 (PDT)
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2613967c88.9.1790138445828;
        Tue, 22 Sep 2026 21:40:45 -0700 (PDT)
Received: from [192.168.1.132] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm2685952eec.2.2026.09.22.21.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:40:45 -0700 (PDT)
Message-ID: <07e73495-ac4e-42a6-b5a3-5eb11021d7fb@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:40:39 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing
 and connector mapping
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-9-elson.serrao@oss.qualcomm.com>
 <8daa32e6-f140-44d1-a2d2-c475d8a5959c@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <8daa32e6-f140-44d1-a2d2-c475d8a5959c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KYaXq5ta90mXRzY5lNCH0jOtVo7PM8VS
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab35850 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QD3PrJr-WEZcEFCR36sA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: KYaXq5ta90mXRzY5lNCH0jOtVo7PM8VS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOCBTYWx0ZWRfXwqkWLBZ2VlZP
 9o8+GNgFXT8OV0O0UibxKD+HmRMemEoWlFh2PeGx8AneGgRd6iFV/Pcz69rtvD9fK6tLfTv7f0g
 pgfM0EY3fwwT37QkybIdmFzzXDVjr9Pl0B6QYYRhoDmZ+1NWwYo3h6E4PU18nCK6U1PdC8thwbQ
 QN3SfKBeBfHcUDG6KLCV7Zn8XxC83VkvNFXsVhRfgf0Hnp0h9G2AD/4wCXtwkiAwMRGSKuL8bKz
 AbksSVbVZu6hZdmO4ElWviX0n8UO67FwJzta4s3x2gMV6oPnoHXT4EIXjw6Vw4H2Nexj/LanNZt
 3kGe2+IMrR/H7mrzI1wNHlYuW41cFebLTBxiKu9WTpO5fuZAbb5hX9KrHuF7+yU0ApxtxwDhk0/
 f6kHebh/vjPVfhNAzEfQvDm0DA+wQ2f2P/0GFb6mljnBoDySAJpWy+9j+kmvW5tWjKv+a4h1k+m
 xwowBiM3gnDzemtKm6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOCBTYWx0ZWRfX+uGhi8WJxnVD
 wWzs4HC/YH5OCiPXVM8pWrkO1pC5Vb6g5SaF2IepcLMydG3UZOc/mFmvfI4Zgjs+gWU2aDafz1X
 N89cMi4tkwRFzYaJnakMx3m9yo+8INg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230018



On 9/21/2026 4:37 AM, Konrad Dybcio wrote:
> On 9/13/26 12:53 AM, Elson Serrao wrote:
>> The existing EUD description uses a legacy single-path representation
>> that assumes uniform UTMI routing. This was sufficient for minimal
>> configurations where the USB port operated only in device mode and role
>> switching was not considered.
>>
>> Update the description to explicitly model the topology using eud path
>> child node and add a role-switch declaration to reflect role-dependent
>> UTMI routing. Also on this SoC, the EUD hardware intercepts only the
>> primary UTMI path. So remove the USB endpoint mapping to the secondary
>> controller and associate it with the primary controller.
>>
>> With the intermediate EUD node now in place, update the Kodiak board
>> descriptions to map the USB connector endpoint to the EUD instead of
>> directly to the USB controller, reflecting the intended hardware
>> topology. Enable the EUD by default now that the complete topology is
>> described.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index f41ad446a39e..b1f1ff6b99e6 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -98,7 +98,7 @@ port@0 {
>>  					reg = <0>;
>>  
>>  					pmic_glink_hs_in: endpoint {
>> -						remote-endpoint = <&usb_1_dwc3_hs>;
>> +						remote-endpoint = <&eud_con>;
>>  					};
>>  				};
>>  
>> @@ -1530,10 +1530,6 @@ &usb_1 {
>>  	status = "okay";
>>  };
>>  
>> -&usb_1_dwc3_hs {
>> -	remote-endpoint = <&pmic_glink_hs_in>;
>> -};
>> -
>>  &usb_1_hsphy {
>>  	vdda-pll-supply = <&vreg_l10c>;
>>  	vdda18-supply = <&vreg_l1c>;
>> @@ -1573,3 +1569,7 @@ &wifi {
>>  	qcom,calibration-variant = "Fairphone_5";
>>  	status = "okay";
>>  };
>> +
>> +&eud_con {
>> +	remote-endpoint = <&pmic_glink_hs_in>;
>> +};
> 
> Label references should be sorted alphabetically within a file,
> there may be slight deviations because the tooling to enforce
> that is still under development, but let's try to not add more
> 
Ack. I will update this in v9

Thanks
Elson
