Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314544;
	b=B1vqu5MMJdhAuXelRSzRMbN/p3JhwzXvYlO95kX21f95dCsxll14N5iOx55hKx5mnkJT
	 v3lYvZmD+vKutT1/k/u0R0WI1CFc/iswAzz9hj/uPHsq/3nEYeAibFfdMpIi7gofxI4pe
	 b6TatM1nOPcbCi6/xLWLr+UvDTKFi5r+VAA5FMf33bkKkJNXiBpgHp8i5afXRmmm1zK0N
	 7AWOqFY9101/2UgfAz+yhb6zncADkzqMe09IV7DWFh68vXMFijATr3Bfk05AFey+rWO1t
	 MRKX0Wef3B33MYVJfTn1NvIsq8h/7ElOxtbuH4K+RZXXj+NZaRcCsPOILW6BNKfgGxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
	b=BCOl8mngwfHjfqSdPcdFXtyoNNhZBWbuiR8hdgY6QGPrh/RrLdVtK/3/a7N/ODxOW84c
	 BKJC0+KltPE3kPkFUCuNd6XQ9ooBxd5nxF4IPhurA4JIsX0gRayGxRHhl0jrJpjiseu8/
	 ZkK55ftxaN0bmqP4Ptpswsqw1pDSuhndlaTJ9cHz27zEJJpNsRgM5bPCHI7RPgaRAsUI6
	 xW3FWKx+vWRb4GN+qLceHtjSxLIJXHIRHPKs5HMzRuuxl8iVYHZ4Q5KKZAcpswNeDAezD
	 eWZwm2BXwsSo/WzK2NS1evr2s3bAelZUYbHFEQgd7Qo1citvegeBHZitlSxvOMjDC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfOkZ+eH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8D6sfUo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577D606A338
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1577D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfOkZ+eH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8D6sfUo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAdne3218211
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=; b=dfOkZ+eHCzjaObQa
	arqogdPgi6Sicmsw8s9UW74t1KaD3DEI8mGFbx26JErUorxPHUzWEhLVmrhGkgKc
	SnSkCuZ10nJaQ4jut8xSzy6qwkEpRGQxeVOqvTow4lgJu2h9f6w1fSaC8VDskXE1
	qekFaTr8/B4uo8/SSpYz3kcMzuum5Do0ar6cP+F1xDH3Sgz+EFIJbW4gprKmP3LV
	+1Q45fBRG5pzz9b0q0Sq3NiN8WO2w8BLQ9n70oc38FEvFGghOVciXjt4RrrXPRp/
	0rQ7TPy1mnCzCz5lIpbISeh+1TfLVm9bVfSGxzmDkFQn8Olvqg9vBn6RwBRcb1yu
	TQh88w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd9q05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:42:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so55702285a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794314542; x=1794919342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=W8D6sfUo2bQIKg5aF2sklGz63ow/C+u8Ml3CTAfn/IeTp79/hEBR8Dfiw01hBr3CvA
         FNWcHluRpUzItXLMtYPonKIeYe9OjSPx7xlrkwermzAF5l82iJ8xSgbeZ0+Yr4EbBh2f
         EKtKa9O4bu6YbqNEli6/IHUFOC8D9dRjeAWMqLmiz8yyeO2s//f10mXlg5LHuB13OHAR
         rPn6OTP8dIRgVegLe+C4049aLMvQjCFIQTXpcUYUdGn/bVNAgt/oHYkAGfTcZ7HDyxHX
         C1ORwljjeOhTYzLwbZM9MiTA8SLfZaRFYsOExiRY2ryIiLMyOn2JygktvRxJNTzbywaZ
         zKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314542; x=1794919342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=xdks3p1RkoexlhzwCgm6OHyrYeS5WqOwpMEmTSPdC3U4FgdDjSbt67nkneJMWrxjtv
         GjR6cq3jPoGqBeN+J1m03Ox1CFAMgdTU4y33cn3gaDb6T2CkzHQsC3EnXiccUnpx+YAh
         SK+LCARQUi/y56PcxSixQSnhkG+7awDXiK08JEnrXwa7oJEh9DXHw7IXISTsdA68tXDp
         yHQa0lWPv8KbURQkDpDq+zSojDjz7QVSpE2DRc5BLmMjKaQBSBaM9WJdQyMlau/g+Zi5
         ZUq316JY/YwdsuIySCxVtNfwXA7jIC16OjjmS+fOwEPZ5wlgRWSVfswepPy5L66bsz1X
         cm+w==
X-Forwarded-Encrypted: i=1; AL+hErGZYzPU2h6oEdKu1mOk4rT2S1GGQmdQ/Qh6POGOnbeo7Jn2VXOKoj8D8F0v9wavqvxuc6zJtgj2/QA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GawSsMIln9i0NMQrJ0EbdTGLONSMXsBqY5gsfh8UObXw1oRj1
	sxaC2IwsWiHcDjMJUsgS8pSTaOQWYXApb7hASwl1i6xnXTy8P1NaoysdC1LH6hFFIj9ubC2Afx+
	7+HZgpbOOtG1vTv8M3yIrWmdAte/KwmadZY3SkyrXnixkvJpdZVwVVIne4bVk0tU=
X-Gm-Gg: AYBFou2HAyMqS5JZVhE5YQ5l62oxOVmehuYFOuVkHcjvbVZ8HC2uvEdvPNX0Na/hU8R
	Jw/5Q56r8mbVX02+qqP71HR/76b02a/FVCFMylpRnbuzWdLrD6azi9LkNgo9/rzVpS0JdVNE32j
	OOIe1u8th7Rji5TD7UbZhhvlXoPk4plat5WLwaa0//cnbsfdvfd0lUlGTcuugAbDNjizk2wvWRG
	maO+08+mS2yOUIXvIDfzHaBK3dOjOhDjQrv7SLCeW3OCwpgAP16SCj3508u+G2wYNWgCQWt99ai
	FxnipwI7jXEfL1g8Ffwmcvj/atzGMrHA0pD/AOm6WNU6HxRvqf7WfXN89AnDEwiyLa30WOjaC8S
	pI/qWrMJJnC4YkxsYSVf56zW5jxAEkkER7o9FKPZPnSNGOqpVgQPYbh/H8mU4dK+adeQVw7o=
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351995285a.4.1794314542087;
        Tue, 10 Nov 2026 04:42:22 -0800 (PST)
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351991585a.4.1794314541623;
        Tue, 10 Nov 2026 04:42:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a66b9sm103217466b.9.2026.11.10.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:42:20 -0800 (PST)
Message-ID: <7fb5ae20-c4f3-4aad-8d7a-a37a6ad15fb7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:42:18 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Sven Peter <sven@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RQc6qryhsDEHGuvNWc8FfM60XCu8Ubks
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfXwia+LAEc2oIW
 8WielD5IURILf3Q1OmoIN/16Fa0S7CYYT+4+EJE9pOafcGNZeeBpWOV8KsfALwtmMFRy16NsFeL
 VTWtCOUYCsfJTiVq08rEBml/g2AqY18=
X-Proofpoint-ORIG-GUID: RQc6qryhsDEHGuvNWc8FfM60XCu8Ubks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX1RieM0gzB4+Q
 ntWid9vcng3cs4Wvq4vJXZy27CSNK9MSdPr+Syh26C+6S5+dTeYXfZ1f5LfKckYyV90iKhTdCY2
 WiWQBWm7eXdy7gK58Ozm3Sbqf6h2N79Vx7dgr9w0O4oL1OpE3GVAjgwlA4nVHau/+ry/tLea3/K
 tA4NuvKqc9Ttl8iEll0Azz4/cHVOIsxPwMMUwill4Kcg9HtK67981X6ltxeKMfQTk0z8m37QRpK
 EioPsekMqIjtTI/JMKuaPmqi/CA4ysUCsXuXflHDIvgUrwGAG4KUh+zXkBXKkC/uCQ7+Lbs9uqp
 P64bh2/4dRX1SYV5hPhaFiCyt3k+I4ZA1IA40mQIEWch9+lV4APOMS7AoqfKu6Mf3808yPBTgiu
 AYDjI29C9aF+HNQrs+Fu4nihijjC3xi5bQHwspbKWQPGBiEIWfKuNJIDxrW6KIQilCh7HxHB7LF
 6nktkmHFDqjtelkBeRg==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3112e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e4OhxiAmdoAHhBioD_AA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100050

On 11/10/26 12:48 PM, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI support and allowing PCIe
> and platform NHI drivers to be built as separate modules atop the
> Thunderbolt core framework, several NHI functions and structures will
> need to be exported.
> 
> Currently, several of these functions lack standard subsystem prefixes,
> risking namespace pollution or collisions across the flat kernel symbol
> namespace:
> 
> - ring_msix() lacks any subsystem prefix and diverges from all other
>   exported ring functions in the driver, which use the "tb_ring_" prefix.
> - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
>   prefix used across the Thunderbolt public interface (such as struct
>   tb_nhi and struct tb_nhi_ops).
> - nhi_msi() is named after PCI MSI, even though the ISR simply schedules
>   the interrupt work and can serve as a generic ISR for non-PCIe platform
>   controllers as well.
> 
> Rename these functions and symbols to conform to Thunderbolt subsystem
> naming conventions before exporting them:
> 
> - ring_msix       -> tb_ring_msix

Maybe nhi_ instead? `tb` is used for the software connection manager-
related functions

Konrad
