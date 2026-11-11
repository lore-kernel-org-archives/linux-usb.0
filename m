Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367910;
	b=xkGD/XGYiFu0CSHdJiYmuSbFZgwd0NYL6lkKwbJDJEJ5Fw8ObADqPPYdi8Hrp856xQpM
	 xqkdEfl3C3S86uxyc0LxiP92r7pvGUH/TP2oBnPtfGa3RsuCkFDlJbWtu066yGaP+9oHJ
	 aP/uAx5kaFaqZjSe9mU8C5sADVw+2Al20lDsSnKcXUJrMsoVmm06iPnLgqg8baIsvbit8
	 37YhmjivhqEzy9MK+79NuGJM6j0o6c165Ye5UGuf41BaKMW1Hm3HsLnYJpHkw+7iH5XUx
	 0JTRS4/adcP/ckV769qHODxtcA1aj1SuC+VvWmvYMuRmc4yUcWEFp0ps1O9I4svFMVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
	b=jI1cYsmxM8tw5tG/bm8KCw/+jT+zLWUR3ZjAXezWMmC1b6md6iZduvg7qoSdBgMXyxo2
	 n7A6wdTA3jOAD/o6Sh5JMA4yEJ2C4N37srmtb1b6h0+SO+P9pa6YyTOggqaUnFAQpH12q
	 q3T0/nL8cJOQ6cpHY1g5NgdJ910qpxv7iH5O+WXhN1rIT92aRPTL9dQgbFnv5Ce2/uBlh
	 AhiKM6m/d5UMTC4lA0ld59amDiAPzvDM24nJcty3b6sKUsbrFENnZzt6Z6KmVzgIynMFz
	 5OhnMdgYe6Z7at62zwmdzvztfaDXJFCyS/gWp7VlL8t1wf5JbSXXOjn7P+25w0iCAUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuRGy0Y0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ypax4VbP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B924606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B924606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuRGy0Y0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ypax4VbP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB29BXF450479
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qNGauoob2TP5WIpfVA9MGfoc
	3EzZmkSfCenA2eySi4o=; b=AuRGy0Y0w3oA8aN/uKuSGfGyCz0wlbYNypqRsPu9
	+ZtFtOtTAwbuoUnhpJtEQMCjw27JPYaoUAtaKbdcsfvYiKVMbexGfdBdJDcG6pId
	sWLIOVJ3PuMI+Jl+DXQVH7M9IbGXd7FfE8ODr8IlsajMJoXVsP8/qX4z7Lj9wari
	mKpZ2EWwLRfaN53Bb6ReMkH5fm07Edh8rjxYjl11oHCjydkCRKyJmGcwsaQ+f4K9
	quzSc0oMqOmw/kn95O83TuCtZPz5ZCU7oS17wTsspDpa4790J9X7Z/+Daf6HXi31
	JMTa2yGPcONmTSicyEQ5EKQbRaABsEIvAedG9dzxjkX1xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawg8hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:31:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so4090588eec.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 19:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367909; x=1794972709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
        b=Ypax4VbPE6ye2OvXa33EybZYC+ejnCt4k16K9raNL4HaOZIjmxgH0YXYia6nWgbcmd
         AXohEcgvrv2nV5T6PuWnCTDoR5omr6xsSU56lJJvftZsYN1MpZIDXOOsEd5M8lytz/Dp
         CM6z5QDvkvsDsQu0H2Rd3VwfV1s6F+Ifp4Nfxf7BioUFniIaTFW4MXdjJCG35uv9lDJU
         lPnb/Iu3y92BxVJqtKOQkpP/JlZKwFieKHXOvu8DzsrYTnCv55DqisyjWxMeFf8QDhnp
         CaUhasuZaSTz2YrarCaWqF1EdO/tBAMgfTSTh2SG10AEYF+raGTDX6skDbPyHapIO18Z
         MyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367909; x=1794972709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
        b=LVPAZteuDfQy3cFGFwwwhmPXPoFWJsayloSC9S9oeLx8KyFKYQXyVD7+OOhjCHJhHh
         9vNQ+Qr3a0GtTRXEpWNjHLXamOV/zojPbF0z99O1+mI1/jrCN8W7f5xkv5/teaWW+CX+
         nVayCNOA6T5TL2z3A8tngJWf5ZSHqpLDiEcfUuUbfXQIpVnQFSN5oA11DFec+y6V6XyH
         gLeA58DcMu2r5ucRkuotBGwQFj6o1uvDsRyq9pKi3cv2u8+8s7LsbXe0u58DQBKQkHjx
         c88U4pGz+B+jsVdx1ldNQCciYTTezkDvlZf3HEoxty5TW3Du3gbLJ+L3OXk+6Lyo/mvv
         M0bw==
X-Forwarded-Encrypted: i=1; AL+hErFy09HpimoTqgSEHRQ1+CTsEvO4Vo6auLKYXgUEnygT4bVJxYd1IzK74poDELRsJMryqXFmy7Oxp/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vQK5ZLJ7xjW1prx/yMDMRKeTrawKbvyCIRkQHz3m1eB8bCRdb
	BaEGOtMppCQmXUqY2c5BXjz7f2geQLiUcwzdPZoA0TOX1HUW/RB7hMcAThN5jfIpjmifBISrWeF
	DdIEKDaBHrbenR+gqO20uEG/h/JiTimis2tp8mn16LTTh6XcDUMgEJw8PHMTJdho=
X-Gm-Gg: AYBFou1wDC8/vAP4SmjhmAuZByKqjiHUVYj9Z6/m3tNAfqt17YzREWKZHXEXyNh8w8Z
	0zdC6xHrRTxHKHl7LhOknPJadDAbYIGJ1TAoxTPDvJ/rFVDFUmzbYoQPVTPjKrpufc5oqxGJqsw
	40JZ75eZQuBcGKEMM2alk2mGvOzi6iqRKKB6GJuY7wum/pfAENqtQueKxtfZsOFr2fnGhr6t4Ap
	M34XA1tCog9h96c6XvSvpClhsdAS5fnbx8SjoDdw2fVE149zqf5VG4uWo/7je79elA0SJ44CCQ6
	RNJ+oNW+J0Tt+/Wy3+ELJHr0dViAuwQmzj9zetlCn8asy0lDusyLJECgFQih6RSG5x1/H/gwdz4
	KFiAlZzduz0zlyvj5p1dulGhjWVDZkm5T/cC4ioSzpfow1Efp5fT+AePoEM91INgaF+zFklbkDo
	Lu2BdDK1iqxskJm/xUkfHf67w=
X-Received: by 2002:a05:7301:618d:20b0:36f:6b99:f963 with SMTP id 5a478bee46e88-37685d72e49mr1839296eec.21.1794367908692;
        Tue, 10 Nov 2026 19:31:48 -0800 (PST)
X-Received: by 2002:a05:7301:618d:20b0:36f:6b99:f963 with SMTP id 5a478bee46e88-37685d72e49mr1839266eec.21.1794367908089;
        Tue, 10 Nov 2026 19:31:48 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm11513881eec.6.2026.11.10.19.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:31:47 -0800 (PST)
Date: Tue, 10 Nov 2026 19:31:45 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <avPhoe95Xjn3A4ec@hu-petche-lv.qualcomm.com>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX5XjJNLEPdAi4
 QdezIIYF/R/C7hwK3EDEGn5i1zcoZ0EI6GU7BkAsWwv4I0IOYOasA5tTfB2cqc++l+iVels7Qe3
 ZkHp8YM10tLkRU9R444pRDwQidbNQoo=
X-Proofpoint-ORIG-GUID: AXa2EZ2ahalz_QFbZYEzaa77vVdeiY_I
X-Proofpoint-GUID: AXa2EZ2ahalz_QFbZYEzaa77vVdeiY_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX9blX2HQbhBNv
 2sDdgIHNW7QZ9GxUaaMd8+NwpMbjsY0NGk3NN5LRwurWH3NKEQcpLEC02AHZkssnMViZ/sYV1dD
 9Ix32zm5FlrXt3cxR4oQxd7+30/GDAdhZMp+/8OY/NhMmlM42cTAyQMnJzcXmk5o+xhV8+y6VJs
 GYx3Mt1alHlTGRHEj/aRkgVnHl9CiDCtPoHMXATJDuo/IBauVCVjBmLsBcWl0P0SzR3C6m6u/we
 wTyuctYCCUncoj5SVXX8wUy4miYBVvyp5+tESr0DOcULMTQZn+AdLZm9YiWcr7TX/jmoSzGYrsa
 edxYkd9TXXHPYvYRwtN4No0crXWiy4OhqmBIIeKdhuQyMWlosC2LzwCkUkhzqXFFlxM2VqWA5cE
 RfWUT4tsJzYQHklu1qn3ptYS+x7MtVRGCxT82vd2iG6abo3x0+b36VeNPxa+EW3uJkp8gYO6c7f
 VYF8E+a5XVObg424wgQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af3e1a5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rNO_JpGmdzbLC-vSDh4A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

On 26-11-05 15:32:16, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> frequency; the vote-to-frequency mapping is platform-specific and
> comes from each target's interconnect/OPP table. On the tested
> targets, the old vote kept DDR pinned at 1 GHz within the nominal
> corner, even though DDR can run at 1.5 GHz (+50%) within the same
> corner. At 1 GHz, glitches were observed during multiple concurrent
> USB audio use cases.
> 
> Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
> With the updated vote, DDR is allowed to run at the higher nominal
> frequency, and the following were measured (not merely projected):
> 
> - USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
> - RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)
> 
> RTD-USBC is the round-trip audio latency measured over a USB-C audio
> path; lower is better. Note the +50% DDR frequency headroom does not
> map linearly to the +16% throughput gain, since throughput is also
> bounded by other factors along the USB/DDR path; the frequency
> increase is necessary but not sufficient to explain the full gain on
> its own.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
> v2: Added Details of targets Tested.
>     Added details for usb vote.
>     Added KPI Details.
>     Dropped USB AVG BW vote change which is not needed.
> 
> Link to v1: https://lore.kernel.org/all/20260611081831.2743464-1-akash.kumar@oss.qualcomm.com/
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..3a19385969dc 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,7 +46,7 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(4500)
>  #define APPS_USB_AVG_BW 0
>  #define APPS_USB_PEAK_BW MBps_to_icc(40)
>  
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
