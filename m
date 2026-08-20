Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528943D9046
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213619; cv=none; b=pcXZf6eJxHyFP0muyYZ/Ze3hCnSCQAC7+pnMIA76SSk5K89yxKdpPqQBTVvpEjzkT+911XrZPJspSXUIfnMbeD5r7YPK6apQlfFM8SL85pbFJldlRsWb5N9qnX+7BXER8/kiL5pM8S8/Eg4EQeyTwYEEWyla/V4XhjarOSNeVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213619; c=relaxed/simple;
	bh=o7y9i/st/OyyyYHXaxy+xTSHPCgHCDfViDGCUPeHkco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/C7axd6aajJgE8zr0othLIc/MzyLv9n+M7e+ZIu8Y5/TqCA+kvs0MDJB3K3utURxzmN7V4X7bWK7P4C07Kd70S3Kl5rBrkGxmg7oDinw76ytO0BRC8gacq6uaUmPG/dt5xtpHXzmrrb91YqxaaV+EeYwlsVONuQh2l0eDL3O5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSPhujlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwblgcuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSPhujlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwblgcuV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K5ZDdS490916
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSlQVMQM26yZB8tC7ntmn6PmxjJjFOHICmalvEJDy5E=; b=YSPhujlZn/CFkduG
	MianceK8oKZICwNFFGRvwFaz+DONxfSjDtxJ7j/OgqpS8PSPIvIujWVGgsY33r+a
	bDrWaTPijECg1tKLYMlv8RXiWpzHZmPGxti4XqSZNThpoSJBX+DxyPufMz2sX05/
	GVk8/rb4tVOmRtPQSY8QDV4ypI2a7TmFXcH8+z948l7N+mzT0deoDRRkqgIIL5yc
	+ka4Ftjdi365jXGSmLfLxTdCwMbf60ZyDtLut9LxH2G1NL+2/+lZ5rafH1yNVPQ1
	mbWRhHMn0F6ufWubwcVLmbzuo+oeUQmsaXKXvsSkONrEaZ5RdU1TZMd6iNuK5D32
	CbSneA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervkwvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:13:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so674581cf.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787213616; x=1787818416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSlQVMQM26yZB8tC7ntmn6PmxjJjFOHICmalvEJDy5E=;
        b=FwblgcuVf+AQwXkQANeYAxGnJhXtdGU8OnX/mBtT3/jGLVnduuSE/NulLhUOLpA0hj
         nujjgQyogOvQhfRUskbPCElUPuZ8Z0ZOQ9wULJN3qoHrGoiKU27NB8e1OcPmatD1NZAk
         AErKAMBg3jeSL5cWP9gPbW/gszxj5voTF83W7zGDqOZ9X0O354GcXRDleTATxI/fG4PJ
         X9Kk23jTvujBjC8IymRReZklhZABKjv/IYdgAtgi4ra9P/MshaPB5k4kqbRSCGxdSvdu
         JRNcwoZbQ9s609lI476QuowsswEu7nxPFI7MaV2JHSroyNlPVvLlrK6/WWLx/d64oOEg
         zhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787213616; x=1787818416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSlQVMQM26yZB8tC7ntmn6PmxjJjFOHICmalvEJDy5E=;
        b=IsUiUAKZdfa2Et1Zx8k0Ubp0avO7nqum4u1ndVUXBTwcT5lvWwdsmQ2gpK5QXYcOvU
         rKeI6HJIIqai59BRAYoXe9UVYYOWiJp1P/Sa3PDc8Dd4+Z/sL+7lCyzyotsDPl3i6Ad8
         beLaumubz4tzH+hLWeIgtA+EFDf0R8KqW5+/hVmc6BHfcLkjbO82OggMabiJj53tDxbu
         JPkSUY/JwgL75pYpCPMC/3fnn829xd6OL8tnOrBonOIRkvZ40F1xBYSncOKZAKgTd5YU
         lLD4070ZYqE+Dbv96S9oGK0UpgOGZO1CiK9QLVUIMJG7+TVfPzpcNyigOzu1JPa2YXiQ
         j//A==
X-Forwarded-Encrypted: i=1; AHgh+RqWGP1OzdPrArrsZx/UII0P18hZqwUnDb3OaoEWZze13YblzxCS94+XNW7TumwzhTfcDxEhyBgAYRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEeac5RW8Bs525dw5g19xMJt//mr7HMwlRB0X/w6aesFJOzgc
	27rO9xfNf/cRow4dfC6QgzdBZUIF+SrofH9sgY0mx4ZBFRzF995rLM81XfeRDqDz0xb/WJIY2qz
	Cx+gSMT2Jp82TkK8wWLBKILb3haRUw3F46NfugZKZugVjQWKQHu3mpRGwQlK2cKY=
X-Gm-Gg: AR+sD13c9dUQIeBWciK9RM36hCa6Bt867IxaiuEtyxBGMuxXHtJmu1qwgqfgN+ABk6b
	xXdWVdp69bdZ+KeITrRwy1CXv5WCGDde1DtpQsrJQEbxh/0457tutk50PWX5/Gvwv6cskf+H0ty
	O3gJCopBfYo85bEho9pZckURs9+Tdfg/PaDqjapQDe0HEVUBtb/3vF0Owu8wRt+V1MNw1Ybupo7
	6ad8Cez2akhugZXb/Q0BU7fvzhsmJLe3xGP8RM2IfbNuLJgdNzglKYPddR9rX8+yJMV8lrUWf3G
	HByffC7cYy7giee+bBYdaWkErv+NNT6+6XUQGHPcdF/QwHKO/XSMf9KZlED15QEsyOPFQFFc5Gt
	d3v9R3nr/nhNBFUAdNWftaiVJ
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr72169491cf.2.1787213616347;
        Thu, 20 Aug 2026 01:13:36 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr72169191cf.2.1787213615953;
        Thu, 20 Aug 2026 01:13:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459223b93sm38324266b.61.2026.08.20.01.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 01:13:35 -0700 (PDT)
Message-ID: <e06004a4-4ed8-46f4-a949-8cece1348ddb@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on
 stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819161950.77858-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819161950.77858-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3yqQP0xMldKOcfn3jiNfxxcceGtWAkl-
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86b731 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ywe33jvvH3eccHNFifsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OCBTYWx0ZWRfXzcxAt8ecqoyL
 fDfLOCiBt0yDwXlDUPweQRBEw3StMRLwMl5FfhBnc5unIOc4jCE9E8JAg82cn+NtpjXarMimMvp
 S/aENuFWXkKUGT4vZD5luXqDDDwdWi/8zogPz6TBhXl4eVWe/Xz0R9cbwNabrJhurKy7yusfbxJ
 BFey2vthaajwD32V3ZMJarCZFPBs1dHesRO5oS2JwRZbJo40WOl0od9RlWIV3M8aO1GuBQyPVkT
 QenonKkrxGQUm6Tn1iFVWFybOO0CwyhGI8jn/40H/1FP1cJFOw57E0jsYVpZ1GgAaR5nRHXocOP
 YRSpd+ChwVv2ASabG0FE8e6y4z3JSHjjFbY6AGoNbCRc/Zs830WCrmLwneAm0NiykARIEeynUBT
 nUXgnuVvK6c8tUfHgeGbvuQFBf5tUzjPiO2gIDvd7yJBo1uoNGKQvyNOjhXRRIPfnPVE4grZjoV
 WQ+uojdiR/L4Jitj95w==
X-Proofpoint-ORIG-GUID: 3yqQP0xMldKOcfn3jiNfxxcceGtWAkl-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OCBTYWx0ZWRfX/vGFqr03EArp
 yI9pWinA7UpnBAv1ip32Z54Ge8w3ebyPuIod00n9xonLlidPkqkRsFnjYOePvbb+Ad93YnDxRTp
 5LZqfW4Aly3MP16WGjwzXdQE7di+MYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200058

On 8/19/26 6:19 PM, Fan Wu wrote:
> cc_debounce_dwork lives on the system workqueue but is armed from
> tcpm callbacks (set_cc/start_toggling).  Those callbacks run on tcpm's
> kthread worker which is only destroyed by tcpm_unregister_port(), after
> port_stop() has already returned, opening a potential race window where
> tcpm's worker flush re-arms the work.

[...]

> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -694,6 +694,8 @@ static void qcom_pmic_typec_port_stop(struct pmic_typec *tcpm)
>  
>  	for (i = 0; i < pmic_typec_port->nr_irqs; i++)
>  		disable_irq(pmic_typec_port->irq_data[i].irq);
> +
> +	disable_delayed_work_sync(&pmic_typec_port->cc_debounce_dwork);

Doesn't this make disable_irq() get called undesirably?

Konrad
