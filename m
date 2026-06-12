Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696143D5C38
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781246468; cv=none; b=TTM4eidqlBUi0Y7nmd8/i0g2YakSdagMvvEVWBbUK3dE4P7QcQnYSgrJYOvrHrbgITeR/9Nmnx1DdP/EUo6fWsv5t8xB45jf/VFAgzAy+9zy0dxrlgyhpoofWW6D35n4j/iFacgDy4GLsT65sqbZMKITY/UGi8FLh6bblEXFHLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781246468; c=relaxed/simple;
	bh=SCwu4AmAYC2pEDH84RC3L97RW1JBqwpQeUoQyIgVd44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BB6xZwAn5iJKiq5pS99iS79ZAFm/741aqXka1iyuJoZCnZ7jrSPs6/ckvwPGD98tJKuL6LpYSROpVNvNK0G3Sl5awOLYfp2MlxplH3amVLsQHPy8opT84TICkxZwNnxK1h0PZfg7LqQoMIuL54h5DvUn6WtE8f22dTf+3G52dxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv3ioiRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZ+aoBQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv3ioiRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZ+aoBQQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Mkm2502090
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 06:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OX0aUgrRa9G6MztTipGGrqcI
	ri5mfaFg+g0QKuO/wuU=; b=mv3ioiRmXXM4DC/Qfh2WvP/hPJgVoNzPaSmtO6/U
	Gta8kuhvS6UcTG+rYOqAzkv9ttIDpIuntTLYAdvSxK0aAMCvyvD3UJEfTTowX44x
	VtsVMvkFUW+bBAE1nWxqLu8WE+caR2xROU1Lnus0Z0NilDeHD7GkV4iNA4HoLwdi
	9G5mpbc2+F9ZdBCF7numg9FxJ4Gzaapizq0yKtNIpWDKRBxGA39eIz4MrvVr2cpD
	n45gdZJOuPDlUbMrTF8po7k7S7+cJiPrGokxN+ubXJxjrQuzAQatPGRgeiamwNSC
	9lIlE1s+jEImhtYz7Xw34dOce9P9s7Abc2o7zJjnpT7Q7Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd2hfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 06:41:06 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b07e2003so589025241.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781246466; x=1781851266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OX0aUgrRa9G6MztTipGGrqcIri5mfaFg+g0QKuO/wuU=;
        b=ZZ+aoBQQoeMC7vV3kQrouMIVdFCgOfFuihkfDr0OM9PbTfCuLlWAle/Ht+3sausNM6
         DuO5hX0W9wN/twdyyZQrUKFZVTCfOxfaPupOrGTMZlNHF5mxijIyy7acxDivzv8WTOKs
         4tEsZPLHR22hRm1M6pMrYPILAlXDAWe7ms2cVx0WCsMD8XXXjjfW/RNeLpP295rmSDRu
         LN/bP6Q2Oqdfvmr5SVsOZzDaGYt1IfoDB0nWk+AirrU2XQ5QOkH99unhqUT6WrBDlrJ4
         kV8cK0sIwC/+jnI1jw/phAAzxBzb65KuYEv+ZZte/kbzI4nOPItc51+0L6U7NohsidJJ
         BOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781246466; x=1781851266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OX0aUgrRa9G6MztTipGGrqcIri5mfaFg+g0QKuO/wuU=;
        b=jVcnYvoplbsYJMAbLYq5o33PPhYo3fkqpD84E6mUZxeFvN+0j3tJE38/aFVclxQdvX
         Spcs50z2NQgvqpaQMkrynOoolpa1yTNbUzZSqmeTmU/9WSaCpwImWLJYYem0Ek1gbQb+
         h6Xy6Bx2V/+8luq7wkjDbJPeqZqDtHTGYX0wmw9Aq1c1zXPN/Hbf287Dci0efjDd22Jd
         RYBb9bDZPK2UTBN6572/34jXlMvODkkL4FTnq1e36lsfT0NFN+iAWedzXKVDKbGMu85y
         isATh4BGkOLEKYFe1Os6qLN3EfQn5K80v7NtI4YmD5X+Z67wzOa+21Uy1+OMh/WIkbj9
         2QLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PX+UVcCr4zR079UtWxvewohh3PPT3qU4J833Dxwe31LHK7o/ioaKWAwxrMcY9YfzAPK4gw1kV6LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCacj5a+Ftr/hpm8b2XJWWtlZERh+cY2mWF+gLwQxgDJgLiEt
	rPGVqolVsLijLOlpwM0QxBIm0ISgxgVebMl9fza+mw3TTI81p0ElJLog0WkCxRcoDm7shOopm34
	9+wT/U13xgZVfjDh4ORZxmhAdBO2SJ/8QXCEFuXQ0qV1ogOXBIlW+OqUftw8WZnE=
X-Gm-Gg: Acq92OEdpemZ8ANBW69+f+Qq+8RBCmmagb6AHbs5mRcPqa3/VdQNvx/2+22MjGaluWB
	Fpska8sipKqw/K8M7q6vQTS21bgkoFdf95PSjWGMSD4YN0B//avOtflHXYtKnmkIYpfY/+Yd9NV
	wmxVl9Qup4bGsp8ddcS+WwkZtJgii95930gDu+CMhxyIw/0SV67D0FeJTW8CJ3SwsawOy0hViHC
	qPhp92+uj+ikMr7atPsa+QYvlIk0SEebGdf4QmpJQAE7jHB/tY9SBDimM1CxLb/Qij2KSOYyzDJ
	pZlAEbpY2oOzoQTNkVZUKyVzJKX/aUbRG3WAXlV/Sq/0vfcyCYFK9gyOT3yRKybtEs67rw4o4dX
	C8Q8uTjSMJkxziOyRgnLA70Fo+web8yVP9TX6a9EYnaoIneejX8AhG8fpjz+M5XfEfamq0KyrZQ
	S4zxFozhm3VJKZb09wSpfN1EJR+lUMg/nV3MQ=
X-Received: by 2002:a05:6102:374f:b0:6cf:f288:f372 with SMTP id ada2fe7eead31-71e88fd0285mr603732137.28.1781246465612;
        Thu, 11 Jun 2026 23:41:05 -0700 (PDT)
X-Received: by 2002:a05:6102:374f:b0:6cf:f288:f372 with SMTP id ada2fe7eead31-71e88fd0285mr603725137.28.1781246465226;
        Thu, 11 Jun 2026 23:41:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161ef4sm271847e87.3.2026.06.11.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:41:04 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:41:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <v5okvua6bnicuydjqy5pgha66gbpo46g7o45ejhezsgbae7k3r@wwqpqiu5k5e5>
References: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611081831.2743464-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 11xDOz25QhTnMggRkECBAASjFf2daZum
X-Proofpoint-GUID: 11xDOz25QhTnMggRkECBAASjFf2daZum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1OCBTYWx0ZWRfX3arLqP29KJOQ
 gZR+oaPb0/Ghq0F75kpaJOOzT9dvIVUNxw5aLhvnVvBf+VsjpqLWmz/1B+X/ehozMv5QMg4lrM6
 V5izM/uLplt5hWlh5nvtlbATJJfZkigtb0mz7PicYgAnrp8Yn52cP3XSs8huVTJd/i7Ww5FhT9q
 38S/YAuxVhhpaJOkTK3xzTYdbwcmDswhNBhNY0fJ95tBI0VEzCkKetVGvc0PxJCvXKXB6vGNklI
 iHhGCEtT0+rZmggbodpn6EYWhk/zwCfL/nl8y1IdIJjUouvqqeXLa2YS5FvuBTlihz48hUkQFgy
 6z6PIQBtGGA0StNccXcnO9EEatMXFQZoIOQ2jTJrOPKdmYQqrzs3VsE0olAy9QTgA75O1T2CEVL
 tg2fPT0t7ZhsbMg4YzgJVX+vIYbsTkxBsSTnSDFZbZCZasJnwAe23AkyucDmKGyvRoM45tK/51Q
 Ma3wt2SRxLKxtu5yVjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1OCBTYWx0ZWRfXxgA7K69GM+gn
 p243gZOFKIXuuSUBqWv82ZwAfAx5gU47wj/ZMh/MNw7SJl90fsv2RDJtzIUPCVwcEPjLweSRCK7
 5CCGBLGgjGMxEgcaqYdinayxF5I0cwI=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2baa02 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=nxjr3CeA32HRPHoucToA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120058

On Thu, Jun 11, 2026 at 01:48:21PM +0530, Akash Kumar wrote:
> Increase nominal max votes to improve DDR performance and USB audio
> use case handling.
> 
> Currently, Bandwidth vote for max nominal value is set to 2500,
> requiring DDR to run at 1GHz under normal load.

How comes? Please explain the math here.

> 
> DDR is allowed to run under nominal range at 1.5GHz, which is
> consistent across all targets. However, with the current nominal

Which targets? Does it cover Agatti? SDX55? IPQ8064?

> vote, glitches are observed during multiple audio use cases over USB.
> Update the nominal vote to allow DDR to run more
> efficiently, enabling simultaneous multiple USB audio use cases
> without glitches.
> 
> With the existing vote, throughput is around 125MB/s. The updated nominal
> value increases throughput to 145MB/s.
> 
> Benefits:
> 
> Enhanced performance and stability for multiple USB audio use cases.
> Improved overall system efficiency with higher throughput. Slight
> improvement in the audio KPI from 17.9ms to 16.6ms RTD-USBC.

What kind of KPI is this?

> By implementing this change, we expect to see significant improvements in

Expect or observe?

> both performance and stability, particularly for USB audio use cases,
> leading to a more efficient system overall.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff..aa43a03f3c7f 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,9 +46,9 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> -#define APPS_USB_AVG_BW 0
> -#define APPS_USB_PEAK_BW MBps_to_icc(40)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(5500)
> +#define APPS_USB_AVG_BW 40

MBps_to_icc(40)

> +#define APPS_USB_PEAK_BW MBps_to_icc(80)

You've tried to explain, why we change USB_MEMORY_PEAK_SS_BW. Why are
you chahing APPS_USB_*_BW?

>  
>  /* Qualcomm SoCs with multiport support has up to 4 ports */
>  #define DWC3_QCOM_MAX_PORTS	4
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
