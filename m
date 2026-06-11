Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154FF2FD69E
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218295; cv=none; b=iEkYTleqy0V9+o2KL9WiPULqu6DYfploBxMKDo99CYjGKnyBKliiSoGezKyUqShzAiN1POIG4tutc3fni+/N9aF+35BGhmAcK6rp4YjV4ZXtpW1uvFFXizKQvRE3kv0u1cYta2pIjAtM9AqvEBxhbACgCgwHtWVmyE2TrlP9y4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218295; c=relaxed/simple;
	bh=xZU51xsrFDyuXrpPkImrsAeUz73lRWpl+dUEsSpz3gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui6bYy3tTtTb1Z57k8ECducPggeNXT1BPKdd2hhD1p3L0u146UNg6zBxK9ArG/SLp+zFlo95uve+MB52bItoGwNORDEeien1bpDO9OxC9rGKzxyW1P11Z3i+3H06xo3kvEW+CNwykSqiY0Zkl+lkzk3SUTRCwT7ok/v0KZjJWew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/cBAyFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2Ypkzaf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/cBAyFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2Ypkzaf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVPdj1921005
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yfHbR9rqFfQKGmo8JSks8LxH
	zsRizL4Zr30pbCe6ab0=; b=H/cBAyFwe6gIBT5/TY6hD2y3IB02QS+IYkeZ/KL8
	VIBGMOcRoU4MDBHtzgk5IUAPdRSW9M9BWupt1IzGswuFSByO+w2q+gi4Qka5B8XB
	SxvyxM0fMXU0axPzXYASDaUMvyDIfXar26vx4PmlDlNCtr3mMH3MDFqUWf6GxD5r
	1CBUD32WUWxE8EKZiMPNol9sQ4GCmac0PnbV0NWD5Ax/VEsAcmR4TTMKL1votwFW
	xYL3ECX1RhPvpemunnv60uDk47hpW+R4++T+saBffc91ONNRyTpOMl8l2YjG43k+
	fwbW/T23caP4Ve+m3Z58xaePwPdsMrehbTRNKiwkLTRbqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbh9bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:51:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177bddf6e0so8399701cf.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 15:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781218291; x=1781823091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yfHbR9rqFfQKGmo8JSks8LxHzsRizL4Zr30pbCe6ab0=;
        b=W2YpkzafLsI0eSvLk9PQyz53+aKxbVvOhTZ6b4ZIaM8uH44BJHQPmhm+7fIHUFNnMW
         XF7/Y8NZilZndcV+dh68CpUBej8u9QaWZnbrKGdZGoEjBbWNpnwjI9aQiy5WOZt8kepq
         sQg9MeSwkM3aX6kaxBRflTbvqOxypw57Qt2Plx8I/DnrHlZbKb9WfKtwIG4lomBhuC2u
         xynhPlVHGJuZBQyNyvQw5qjUSJ7SP9/eEiZngQb1uabjci8liKDZzxN4ezWPjYlk+q4j
         n16nbK8vP5xJ/ZNEccp1GjLZpDVgw8TB87GssJOlTd0pYvFe5gzU5/9u5m5rctoWJO9o
         a1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781218291; x=1781823091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfHbR9rqFfQKGmo8JSks8LxHzsRizL4Zr30pbCe6ab0=;
        b=YfN9EtWMqjBZLU66qXEN4K2mmmZCDvniMmFzK8BDsACR7OF6Srgq+0DSRs5H3S174E
         dhIOiIrNGkdlS+o/0fIYqBNmKV98pnuYk6mbYhNZSfFN5xfkEPsHOBS+HR+vxJRmflsY
         sG8nDrYkHhbPhcohXk6a8JJhLQNGEydM/knPpv2O1mRssFd6kU0Rs/bxadidTeoxdod/
         BsDomU8PXhEbmqgZybCPoH3VRA56vdKofk+IjpjEwoX+kOGcgHCTMwZtOF4rhSx5HKy9
         VlDImJWg+cBs56/9cJC1q76YtCsWe8NAypRRhQL2mXmqNkddH8OGpDx2WggWaFHunk7P
         Pt2g==
X-Forwarded-Encrypted: i=1; AFNElJ9SMLBcZ0LSWSedrw6eR/n1BdbFA5NKiF4QHMtf/9V81UVp9TifOFkgGvP8nS/8XGx6CEeV+Vfb1PE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28+LNj44E7wP0oi3x3BYBr6qiD7g7lRtSXh8+rq3SYjGiC1Rs
	raPRAiiruhtior9RwDC5XhfcjqWB6u4qQIjFb6jehUt3yuW2bT0Uqr0I9IVE+qPzd/V+gi47jJ4
	5rI/aXRinjDv29UU4Tm3SVI5XIu8vDU7kJRHaKU90WujDJs3KWVXO+kzi0iKtjxg=
X-Gm-Gg: Acq92OHzuD6dwkjYqr3aWCDiqljONgHNcKCDpDLfcOiYZMiIZO+LWtuqwO/SpTDqRTg
	KMC8aSCoXnlV4XPG1qfNhnQZFY7Kvy80mcetGKIWZfMAz5xkI3cNNV1Cw6a9474QR0gKJFTa4Lp
	xXmytuhrE7FD9PyJxUt1sLIrmiO9hesICFmCPQ6bldLoBzwtDpbrQiO03+Bd1JAXQ8y1QRIatUa
	5zFIKMNbUeeIY7GteVsu0WyvYa4ZVXqAUXEUQcQ6R0lucCQlb/8Qp2416JpaIJa6Kugxh9G403m
	n/pQwOUiByKLkZMhX9dcasByAd91H7htYzjetAwGee+1YcHdgpXmDSOe37Echdz8cN5hUsAG6+J
	L9OWoITzt8L8DxYOHxpox5x4efUPY0ITH/ieMhOviNWOSYv3M80dkpAtB71zZMGtqW9FDfx4eUm
	oVrJbBNVp2l1eEHg00DNz9AN+tuQiEg0joqBs=
X-Received: by 2002:a05:622a:1654:b0:50e:474a:47e1 with SMTP id d75a77b69052e-517fbcad6e5mr11463241cf.10.1781218291473;
        Thu, 11 Jun 2026 15:51:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1654:b0:50e:474a:47e1 with SMTP id d75a77b69052e-517fbcad6e5mr11463061cf.10.1781218291069;
        Thu, 11 Jun 2026 15:51:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162059sm65e87.1.2026.06.11.15.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:51:28 -0700 (PDT)
Date: Fri, 12 Jun 2026 01:51:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: unregister debugfs entries on teardown
Message-ID: <e4f6k5qtgzod33o6534jnz4wqgnvxq5yjkeygzqnzertrygcym@cosbugve2oh7>
References: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
X-Proofpoint-GUID: 8IhOFpSKDbrb6nebV15II0MSOrCMf99E
X-Proofpoint-ORIG-GUID: 8IhOFpSKDbrb6nebV15II0MSOrCMf99E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIyOSBTYWx0ZWRfX1gcSm7uToGy/
 sQfqiqtr6fWp1VsJFJd0xeFqKkTafpuN3dVBmDLd+mHNPttwDWr38b9zB8KLJ+Ly5g6Pl67ImHE
 3R+1dI5u28IbVXi7aLCzYEOKPsr8gdc=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b3bf4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mG9sLCa_7-4xFCwKNhwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIyOSBTYWx0ZWRfX8AYr7MBGeI+f
 6QPSfuKtV6ENO0MFXb2/MP6GCIpz9CbcwYF9NQNK0s3eXK+eszSkwHL9J/MYLWpfiyM2e8aci1B
 GtSfS+ly7vu/WmFhlqYeZj3wNdeqY0QCO1y41/7fUj/luxf5xfDDbDzcIxF4Hmlj4+yfP1357Yk
 8wlOJWZyG7PnTa7vZnIwWtP/WL8EhtjvTmPVfhHc3VsOt94vlzLNE/zyQDmjSoX69/ho5JkL+P4
 JITzcNuhTWVdZg4JCRgWD8FA9+HBi2SGJrCRZPXzsaB2nTNtwyJD0FQx/ExynciQhIb8Hxx0Lyp
 3dj9vUsjh+WjuVZOFDaIzYkjDvs+IytZ5LTfOyDk9UpFgF7v4vvTshTOUABz9uRDaAaT0YblHto
 0I4ooXZywDCSlxcnI0/6m8Ky4+Y1zv2sQDh6Cok9ACCOLSCI7HIPbWaIP3b7QR+TcVjOzAtGVRm
 IjVb6k4kh3w4pu8OpZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110229

On Thu, Jun 11, 2026 at 10:22:02PM +0000, Bjorn Andersson wrote:
> ucsi_register() creates per-instance debugfs entries, but
> ucsi_unregister() keeps them around until ucsi_destroy().
> 
> Drivers like ucsi_glink that unregister/register the same UCSI
> instance across remoteproc restart then try to create an already
> existing debugfs directory and log:
> 
>   debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
> 
> Unregister debugfs entries as part of ucsi_unregister(), and
> clear ucsi->debugfs after freeing it so repeated unregister
> paths remain safe.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Missing Fixes tag.

> ---
>  drivers/usb/typec/ucsi/debugfs.c | 1 +
>  drivers/usb/typec/ucsi/ucsi.c    | 2 ++
>  2 files changed, 3 insertions(+)
> 
-- 
With best wishes
Dmitry
