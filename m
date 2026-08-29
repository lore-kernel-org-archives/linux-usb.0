Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603E39794B
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788021875; cv=none; b=Htky9v+zTjcIR1q971+33yG8msC95ihPUWP4mthbVDvY/Xs7i8ijfEbwGFzUV6vageUyylgtI1U/gBLdAp5fTf09oPoHDTVq2J45mb1JatC0QS4JTwEVbZjmqfzU2fvNxZrCMKzpFCyXfKJTgOEeY3L44IP8BWNrXz2G/a78gLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788021875; c=relaxed/simple;
	bh=aSklOJBjcdqPcUYEeeCoNyo0uVQ6XvKNjvYw9Jp6KvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCT1f0eKR7iGU1AQ2B/381UbLsLqCKzuK7a/r+B9nAko0zx1H/T7mQoxweIFYik57w9tdhmYs7KB1iJ21y4dAC2vIOr94p9A9wxtEwZT5WrDGFH1Zk7gfNwGCoImOvScd5cuC2rJv1KrikTeShReoV6Tfsnrn1K+ULAN9S/IuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcuqanXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/waCf7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcuqanXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/waCf7/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE2oLr2431166
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IL2xa6WUcouEeZpbiUivZKwcC8u6B+zkhU7Sq5Kit2M=; b=UcuqanXHhJgtlapt
	ecpj0LrsltnWGgP367OBB4M1UfDXN/I9rzmKdlZNv8K1Dbl2I58LNJ8vGXPyJL/s
	JyjgcaWA96ICipFlD39+Umrb1pyA6IkVigtztwNrB8s26RIO3b5uS9v1xRBOr2Qq
	34DzvXoLjQq9omNR8ClRlM8SwQ9e7kNREfpvZithiC1Psheg/C5bhGp+ekc7jk5z
	lLMDGXncdMNIFMTL5hyzxW2dWjdmIH9uzZBUZIBtBGVIXFz3NRttixNmCOM3c4e7
	PeDCLJ1TMe3/C/9aDDPE7OUwDi0EEcrh1+I66eynD9NS/sBQdWWMrq9sTUVC+htO
	AIGUXw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvhcm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:44:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2635206a91.3
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788021872; x=1788626672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL2xa6WUcouEeZpbiUivZKwcC8u6B+zkhU7Sq5Kit2M=;
        b=d/waCf7/0AQiuaXi+v5By/dlCDcQ0pksVjSiLRBfzo19cijlfNRlFyeLVJBgq6ZAcN
         n5l5KQ4FVEZ7VVW3OH6s0XdoxbsRWpZWSWA+wFDx7h80x3pWwGlsVeqLOl5wefwoPzqU
         C84WghBnRkYy/fqqN45ntK7J1P8z8ZuXYlbmLt8MFAlZ5HYF9V+cTxH3dG+As7cbIUBb
         qbQpqZ9Pu6ens9Frwyx8U7EpNpm73dXQkQliiqKkPfZ0ok4pJQ1oBAq0GcUdLm0nLdim
         DIePXXmYkj3J2E5+2jaFxCTQ6UnkKR5kycG0mllIL23bnBl9xD8KslzUnQV+cf3tlAY0
         QH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788021872; x=1788626672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL2xa6WUcouEeZpbiUivZKwcC8u6B+zkhU7Sq5Kit2M=;
        b=qhlzc5wWptnde292+SeN4i2kuBCTaqwSIWyPsRn9+Naz9OAkDc8yXrOa9se9MZIhoP
         eih9jjEWHxLtGnx6k7KNMXt3Bdjf1NykaZE4GY77B4jZ57tz+TXtPE/gimUUYTWwznIt
         KKpnh16vv/lFtU4kIe30Zz6UPmWM3WTHveklLykULZWdQMirv2zMCLaf9tLDq7GnTwxO
         KVfJKIskT+kTCREe+5TJzuL2i0up32pr0tM5MIDWFzItr9i7peJ5uTQ7RFBBh0qeYyub
         LYZbrVtyw5v3LvrJREUkHAB3P3o3g5y3LFI9cqlAYAVKBOMCHvMd/LFSs7kZuQMornro
         tPhg==
X-Forwarded-Encrypted: i=1; AKwUvBywKtn6Fa+RQBOKq3D1ylYkAadNrvDS9EwCnPI1cwCgWt2KYRJxdkLJPlPBk9CMsOEAloVx6cOfj/I=@vger.kernel.org
X-Gm-Message-State: AFuF++mjywFPImUn19qO8dI63Y895D/77CDlNuaKlkx4oLvwMIyzSIa3
	wroxCZmBgrM70CI9eFoVQWiDUFM3fswv3qTw4bRJ4yylLP5b4zrz9JcLblc4D4Jxb3yNwW41y1W
	Jo8SBYp/3dg/3FwM7s848xzdFreUVn//ehZnDAZHmsKpUxhFCQveFNTyHwIOgXrY=
X-Gm-Gg: AYBFou3JXnHCS6sqVJgxMCh495GPvPKwSs+94rMq6y07HgaUk9cSDs6XZkrfJVEF6Q0
	u1hVy4QxXSoA93iOIoAE5iRz3kCiWTXQMAvd+y3GzCf6P9qajierSAXM3+XNF+Mm5vZd+1jPmUb
	rUD+LdtpolZXLGhmvQ3auOQ73qlqDRAWIUMKei/25quzawbMMtadu65RKOGogbRA3FXgpUrS+1J
	tznikFyZ//5n9St7xJzj3JED0kSzxyn0pyNn1/aA4FWl1xPAVDHiuexCUYoEtptTFC9ImdeQOK1
	RQa5zGb/YlZ3ZK2Tlu4Pbb54cUQKzH0VvadADu0N9Jzt97WoODvIvPYKqnlYkoslmsokddccwvm
	bi2mimZp+gkesOTGZQ02OZD8Lt0AGzIAay52EeyO5iE2k519iDNM7vFD6CihpEexl+FY=
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr27215621a91.12.1788021872480;
        Sat, 29 Aug 2026 09:44:32 -0700 (PDT)
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr27215559a91.12.1788021872023;
        Sat, 29 Aug 2026 09:44:32 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186809dsm12283012a91.10.2026.08.29.09.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:44:31 -0700 (PDT)
Message-ID: <cd5fc80b-e52d-4fda-a831-298f6bd56fea@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 22:14:24 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: qcom: ipq9574: Flatten usb controller
 node
To: george.moussalem@outlook.com
Cc: linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-9-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-9-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RzTvlkdFWGdsQa72vL__PaQLh0b2UkFn
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a930c71 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=jScrFQIav-o397sHpJwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0NCBTYWx0ZWRfXy23smBJObAAd
 YD9YnQSnteP5PP3+TaTyxou5NuZWecNp4jvvV5/tc/MHBODGICk7qy2GzzAGaorRDrOLhejmAE9
 l5T3qwjugfg8vj+PBZ2Nq9iKoERJCByq54D7KH8lniuHXtSmCugNA9Qohr5no1qs0l9wC3U0Q5P
 yIlLfl/20h8N2OKeDXO3fO6skOeNdGrOuxiEooeQ9a/MMqjoWYfmnFuCy5z++SXgzPvtTYBfKfe
 BOyHdAsr8+FC94+g1UlL0eiZGMgim4FOtj7/SLBJpbc2EEbvEOn2xyVSQQKOv3dm77EEW4FmHN+
 mkvlbeivYkYJ13wrmLqj8EF0Xgyhsd/X7WU2jA+zSWxb8QuP49sUHTCqmOGq0289i7i3uI7w5w+
 nhfHJZegMWFNh679xKXrW4+xKHHelYmNJLyA3/gboBXSxE/zSYm5SUjgsTPckgO56vYEFCKwbz9
 U+7/TbdBxacasox2Q5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0NCBTYWx0ZWRfXzAkB6B7cDW/L
 aI4eGSkjwOOjKZKJnzF7ooQtN8ZmYZ7Tb0YG/YR3wd9XnC7Iw8pIJwlf/oH2ox5cQUoPKCgKJF2
 XGDAzIQhpcFVv25mU2XsdY/WzcIODUA=
X-Proofpoint-ORIG-GUID: RzTvlkdFWGdsQa72vL__PaQLh0b2UkFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290144



On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Add property to the USB node to select UTMI as reference clock for the
> DWC3 core to calculate the right values for the period and frame length
> adjustment.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

[...]

> @@ -780,32 +777,31 @@ usb3: usb@8af8800 {
>   			assigned-clock-rates = <200000000>,
>   					       <24000000>;
>   
> -			interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>   					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>   					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
>   					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy",
>   					  "dm_hs_phy_irq",
>   					  "dp_hs_phy_irq";
>   

You are adding pwr_event irq here. So please mention that in commit 
message. Or would be better if you can send this interrupt addition as a 
separate patch.

Regards,
Krishna,
