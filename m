Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972674;
	b=AmUcNmF1xFFONbicLMp4ILONMDVGwX4vdt4eSL3hZpBL5zh3ki4QshVZuVQijnvxooxC
	 qUNAuMZz4TCCXIY8Ay2lWmoh+aI6+2ZNq2e76/9I3ebiMTY9NoNGD6isKqEBZmLhQX10x
	 z/AaOTJiU6s4m67o3l2s+HMa+chLiJDca8pTogMhOba6ACtaI6HTR5dEka6VCA896Xx0f
	 iFGgGgpWCiJs2valXJPBQkw8MhqQGsZts2cdT2sx4bM3lr4YzloRxKHj3tNJGPskYQz3Y
	 SiZik0bFROfEdhsO4tkEgbUaE1vDS9Yhfs/6Nf9DupHgmTseMmFrEAdbuG65r+oGEHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K31sxDosXDwzYBhx1g0OyahYc5+lUBwu+fcusnb+3Z8=;
	b=KdkINpMo8q1mQNq4R5gxgPQ1uwO/auhiWtXiVvrf0cOZENlPqg2DO9itGMtdsAVUVxO5
	 5RZikxGRMoZ+/c6BbdiY1WckYA8rP8/gezEfjLP4bJkn8v5CdLMMnruLkoft7ou8kF7mC
	 jjx4c8USve43SA+PuVL8gnJGY1SRwn+hdgZK2nHVxguiMFi89RLcup8UnTvHCNXFa61SF
	 nUNk+9nhGcWgRKPKzrpYsXALylX7lxH35hTl5FksLsBKlhH2Tl44PleY14u0c1xigTXG+
	 /u2XbFMTqT7YcKY7Y7TP9fqIkxRxhta54vOCXNlnzOO7Kaa7lb4E6zjxOmXTbYAbrZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BkQ7lktx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QzJBjAQL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3647606A33D
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 03:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3647606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BkQ7lktx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QzJBjAQL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2WAWE4060200
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 03:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K31sxDosXDwzYBhx1g0OyahY
	c5+lUBwu+fcusnb+3Z8=; b=BkQ7lktx1VrG1S07h0adfb5+h0117+J/jP0wLps0
	gMK2K4+JWXLYSIJZ8HeA4EApK924RRhSAuI4Lh4nl7wJ/Q0XjWQTnE0lPZCwR8+z
	4IEDlLgHCRSvSY+D9umhIw86sO5/gotiGo+s/4FgUDDTeRnc9UjGxHJldsK1YNIE
	KPQTKzRDVj05f4DiI/AoLdp3A/voXNuXBFjVkQ72+0dxj80GU7Q47xYWdQ90uASt
	Y64Ke0Wve4gyX9JPVmMeNk/l5nf8aee6Lh5eW6mNH99Tn/h7nF0f41J9pQcYJcar
	TaTtsKxeZL6dT5BKTW9ORqrqsqWVD2hU9anqTYJMvMiDkw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvch0qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 03:31:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383165e9b0fso50449eec.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 19:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972671; x=1795577471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K31sxDosXDwzYBhx1g0OyahYc5+lUBwu+fcusnb+3Z8=;
        b=QzJBjAQL8lcMc81WyEtd62UOHqvrUQyMsWEhZXT4Me73jhk4LcVRZzKFTi6LHAftGY
         SntQemT5Z7q8ifZ1aa79OF7ohz2535NVo4SJpGEGKomY8zLO1NICau+7wF3Vr83fAYhW
         CYWH7LriuOnkg591VhSfDiWfxrA7u82vGsli7WZE+tJTd/EZzQQweUEPWApePbY8Y0L1
         1+LJ2BfZ3Rfhrrm+12nbP+H3ls2zndoz7RFH6lVsakeihflPvWk8gRCeeDFcm3M3aiIp
         lgYUCItn88qJxnls5eLi1+XCLpFtF1lyEBPc4aiJtNy+OVAukH8YdZGPoLuDC3ebitVE
         EjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972671; x=1795577471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K31sxDosXDwzYBhx1g0OyahYc5+lUBwu+fcusnb+3Z8=;
        b=05ZLzXJhC7/98IU22RbMYR20jlrsaV66U1h6ccTTvEUM/mWGfQdoVYa/3B4EG6M6dR
         lfeMfMdRe0fx4zKZjp14Q1GRoIRN71T97uSw0AUf7W1aSaq5sXGQKejIoGlEYuLXSwS/
         TKuR6CHS88+2HGfiom3Uj9nJjFFNMn9izaMyg4RN4xiG6ftfbVqDg9xKkb98N5yFQkyN
         x5XyuTxpMGnDdAwjy94B++Ih5++RUzMtfADFJvYP8asGnaJwU5vGeCOTWzKAeofq5Z02
         i1P8ZGrEXeGnvxvb/KUUYv6Qgk46jmnFB/BEMSDLcGxJwam8sWyD3f/AwZMrL/EbCQnE
         J+ww==
X-Forwarded-Encrypted: i=1; AL+hErHjz6x5xaI41wexw38J1Ps5oWdyW/zd48RxnSloNFdvd68NEz5+SoayfIFaaTsFDwllYt62k1dlt6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8roXWmqCQv5lThpmqC/EYoCojHYJfu+mUM/qqxtE/rl/Gr76re
	y8SlG4r7TDRcKxvricZZQQGxmwl6i2aPKHZDksbmHI3HmHy7kgtjdb9etxX9kPAlo9bQ6vLg0MW
	h2BXMuBUfpLDzDycRAMOtXPsOHdE3aJEMou7Bm98sUyfBHooN9rne7fe5TVTtOo4=
X-Gm-Gg: AZFdTZc9at7HzQTPEvlanVMZJMGhTe+uIaUpo010PfROG6d5kQmAHhg3nPraigd/YQe
	dU2XKO0KBh/YphpWeLqBH6RS5N41GD/5viXvJjC3v3fhDU7gitVkTHkB6cRe9Be08NO8mnFPAnb
	ZxnfSzHJGvYn1aKnkAsnb+sfiwJLlMXuVS0bFIX9L8mPMg2uZR2teOG7j/tPzqP+8ZIpj+ZSpAL
	iGRzepb/RTSPvkIKvnvKz+YD+RYHd7Iml+Swm6rPRR3tYMWrYDUiEZ6ZqHACAFR49m5JWVEIOq1
	hTdmF0yWaYatmWUzeDHpmVXsnwSPa98kPcptTSIlsunO8lJOY29twVNsKQq1jHMlRTXBPkAODMX
	0GVeG0Qy0jKBpZ6A3Jnmpnt5n5bLvBsW+Ky+U86llKVfDLyayU+YDQF0kSM011aM/v6JkX4Yi4O
	bajOtjAzT6d8tncP4CFq8xaw==
X-Received: by 2002:a05:693c:88c5:10b0:383:bef:b6f6 with SMTP id 5a478bee46e88-3830befbb72mr190008eec.21.1794972670767;
        Tue, 17 Nov 2026 19:31:10 -0800 (PST)
X-Received: by 2002:a05:693c:88c5:10b0:383:bef:b6f6 with SMTP id 5a478bee46e88-3830befbb72mr189989eec.21.1794972669802;
        Tue, 17 Nov 2026 19:31:09 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800366sm2528822eec.12.2026.11.17.19.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:31:09 -0800 (PST)
Date: Tue, 17 Nov 2026 19:31:06 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Gary Yang <Gary.Yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v9 2/2] usb: cdns3: Add CIX Sky1 glue driver
Message-ID: <av0b-pmrqAnqzgEK@hu-petche-lv.qualcomm.com>
References: <20261117021705.2202892-1-hongliang.yang@cixtech.com>
 <20261117021705.2202892-3-hongliang.yang@cixtech.com>
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
In-Reply-To: <20261117021705.2202892-3-hongliang.yang@cixtech.com>
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd1c00 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JfrnYn6hAAAA:8 a=TAThrSAKAAAA:8 a=6ssd7QQ87Uq_Q1oR-n4A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=1CNFftbPRP8L7MoqJWF3:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: E349lHX_gUR0TkQIAZipfgvErlTNQaTc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfXxhOhCPpd6mCc
 PMzYiSq7GFXasVye0mF2WNH6vLLJnwPj7UJrKXANidI8jdVhb2S4I0b/VBXfEbzYgtUuix4rSvg
 sSU4uJvHgG4qeQyAQLfF96jZdGtxFxk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX4exkglrRlCMK
 4/qYifVlgDJ+Z0UgVyn9vW20REtJq2FqwmY5PnlnJlNm95LLe0sNqaCgvrrwyqFxoK9funkov1m
 OfRy8bPgdNFnQ434eewnqvEUtuk0TpjwpwDmWIIA/itBNOBoQtDm9nz3UBMOo6tcMGdAvAXRaOv
 vbkK09EnfmFyWPmU44uz686NVK+fn+C8OwvQokFXGHP4oje298FVNRU+LlugzJyTuq18Z4qO3vb
 Ec2aE9zZqLQnJ66GpnF6MaT/9XPYZCSAELp5sEaH04OIuB3lrrKAEpJs8Sdi8H080Df/dYCRgRq
 wN9D3MVF34VKVhdBX+/ncOWQDjELVaFxSYAXEAg4TPcSmQYUUyoJ46KexWu9T9MOyYwVDNzOFCC
 etwMNGh9TuL0KnlO2shVNnQsg4LlqGFRaZ1eE1Qf1RQQ3B4nHPfarg17Ogv0q8k/6UjIswpkDCE
 VPzo2VyW04Am5ufPq4g==
X-Proofpoint-ORIG-GUID: E349lHX_gUR0TkQIAZipfgvErlTNQaTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

On 26-11-17 10:17:05, Hongliang Yang wrote:
> Add a glue layer driver for the Cadence USBSSP controller integrated in
> the CIX Sky1 SoC. The driver manages the controller clocks, resets and
> the mode strap controls located in the Sky1 S5 system controller, and
> writes the AXI cache attributes and polls the AXI clock status of its
> own controller in the RCSU block.
> 
> The register range is mapped with devm_ioremap() instead of
> devm_platform_ioremap_resource(): the two Type-A controllers share one
> RCSU block and their register ranges overlap, so reserving the region
> would make the second controller fail with -EBUSY. The offset of the
> AXI clock status register inside the range is taken from the
> per-compatible match data, as it differs between the Type-A and Type-C
> register blocks of the SoC.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Hi Hongliang,

Sorry for jump out late. I remember that it suggested that using flatten structure for
cdns3/cdnsp driver in future for easy maintain[1], could you follow or improve
my patch set for going on this work?

[1] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-May/1128072.html

Peter
> ---
> Changes in v9:
> - Track which clocks are enabled in a bitmap. clk_disable_unprepare() is
>   then only called for clocks that were really prepared and enabled, so
>   the counts cannot underflow after a partial enable or a failed system
>   resume.
> - Clear PS_PME_En when wakeup is not requested, and put the controller
>   back into D0 with PME wakeup off when D3 entry times out, instead of
>   leaving it half suspended.
> - Gate the AXI and SOF clocks in system suspend only when the child
>   device is not armed for wakeup and the controller really reached D3
>   (AXI_CLOCK_VALID cleared); in device or idle OTG role, and after a
>   failed D3 entry, the register interface is still in use.
> - Require exactly one enabled "cdns,usb3" child node and stop freeing
>   the child platform data after of_platform_populate(): it belongs to
>   the child device, platform_device_release() frees it, so the driver
>   leaked it when no child was created and could free it twice when two
>   were.
> - select MFD_SYSCON, without which the syscon lookup stub makes probe
>   fail with -ENOTSUPP.
> 
> Changes in v8:
> - Read the two board properties with their vendor prefix:
>   cix,ssp-disable and cix,u3-port-disable.
> - Do not assert the resets in system suspend/resume: that discards the
>   OTG registers programmed by cdns_drd_init(), and nothing programs
>   them again after the child device resumes. Only the clocks are gated.
> - Rewrite shutdown() to use the same teardown as remove(): depopulate
>   the child while its clocks are still on, then assert the resets and
>   disable the clocks. Whether to stay alive is decided on the child
>   device, which owns the wakeup interrupt.
> - Allocate the child platform data with kzalloc() and free it if the
>   children cannot be created: platform_device_release() kfree()s
>   dev.platform_data, so it must not be devm-managed.
> - Only set PS_PME_En when wakeup is requested, and return -ETIMEDOUT
>   when the controller does not reach D3 or does not leave it.
> - Drop the cached wakeup state: it went stale as soon as the child
>   changed its own wakeup setting.
> 
> Changes in v7:
> - Map one register range taken from the first reg entry, instead of two
>   ranges selected with reg-names.
> - Map it with devm_ioremap() because the ranges of the two Type-A
>   controllers overlap.
> - Take the offset of the AXI clock status register from the match data.
> 
> Changes in v6:
> - Read the USB mode strap register offset and bit position from the
>   cix,usb-syscon phandle arguments instead of relying on the usbN
>   aliases and the undocumented id property.
> - Use dev_err_probe() in the probe error paths.
> - Drop the unused over-current GPIO handling and the unused dr_base and
>   cdnsp_pdev fields.
> - Do not disable the clocks before they have been acquired.
> - Drop the redundant depends on USB_CDNS3 and fix the compatible name
>   in the Kconfig help text.
> ---
>  MAINTAINERS                    |   1 +
>  drivers/usb/cdns3/Kconfig      |  14 +
>  drivers/usb/cdns3/Makefile     |   1 +
>  drivers/usb/cdns3/cdnsp-sky1.c | 748 +++++++++++++++++++++++++++++++++
>  drivers/usb/cdns3/cdnsp-sky1.h | 102 +++++
>  5 files changed, 866 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5144d02fc998..3c609d371306 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2906,6 +2906,7 @@ F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
>  F:	Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml
>  F:	arch/arm64/boot/dts/cix/
>  F:	drivers/mailbox/cix-mailbox.c
> +F:	drivers/usb/cdns3/cdnsp-sky1.*
>  K:	\bcix\b
>  
>  ARM/CLKDEV SUPPORT
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index 39ad23d1ada8..fc810aef79f4 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -77,6 +77,20 @@ config USB_CDNSP_PCI
>  	  If you choose to build this driver as module it will
>  	  be dynamically linked and module will be called cdnsp-pci.ko
>  
> +config USB_CDNSP_SKY1
> +	tristate "Cadence USB3 support on CIX Sky1 SoC platforms"
> +	depends on ARCH_CIX || COMPILE_TEST
> +	select MFD_SYSCON
> +	default USB_CDNS3
> +	help
> +	  Glue driver for the Cadence USB dual-role controllers on CIX Sky1
> +	  (device tree compatible cix,sky1-usbssp). It enables clocks and
> +	  resets from the SoC, then uses the shared cdns3 platform core
> +	  (cdns.ko).
> +
> +	  If built as a module, the module is named cdnsp-sky1.ko and must be
> +	  loaded after the cdns core module when both are loadable modules.
> +
>  config USB_CDNS3_TI
>  	tristate "Cadence USB3 support on TI platforms"
>  	depends on ARCH_K3 || COMPILE_TEST
> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
> index b2e4ba6a49a3..ab813aaf9940 100644
> --- a/drivers/usb/cdns3/Makefile
> +++ b/drivers/usb/cdns3/Makefile
> @@ -28,3 +28,4 @@ obj-$(CONFIG_USB_CDNSP_PCI)			+= cdnsp-pci.o
>  obj-$(CONFIG_USB_CDNS3_TI)			+= cdns3-ti.o
>  obj-$(CONFIG_USB_CDNS3_IMX)			+= cdns3-imx.o
>  obj-$(CONFIG_USB_CDNS3_STARFIVE)		+= cdns3-starfive.o
> +obj-$(CONFIG_USB_CDNSP_SKY1)			+= cdnsp-sky1.o
> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky1.c
> new file mode 100644
> index 000000000000..7738ac7268de
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> @@ -0,0 +1,748 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * cdnsp-sky1.c - CIX Sky1 glue for Cadence USBSSP DRD controller
> + *
> + * Copyright (C) 2026 CIX Technology Group Co., Ltd.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include <linux/usb.h>
> +#include <linux/usb/hcd.h>
> +
> +#include "cdnsp-sky1.h"
> +#include "core.h"
> +
> +static const char *cix_usb_clk_names[CIX_USB_CLK_NUM] = {
> +	"sof",
> +	"axi",
> +	"lpm",
> +	"apb",
> +};
> +
> +static int cdnsp_sky1_set_mode(struct device *dev, int mode)
> +{
> +	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
> +
> +	return regmap_update_bits(data->usb_syscon, data->strap_offset,
> +				  GENMASK(data->strap_bit + 1, data->strap_bit),
> +				  mode << data->strap_bit);
> +}
> +
> +/**
> + * cdnsp_sky1_clk_enable() - enable the clocks selected by @mask
> + * @dev:	Pointer to the device of platform_device
> + * @mask:	Bit mask of the clocks to enable
> + *
> + * Enabling is tracked per clock, so a clock that is already on is not
> + * prepared and enabled a second time.
> + */
> +
> +static int cdnsp_sky1_clk_enable(struct device *dev, unsigned long mask)
> +{
> +	int i, ret;
> +	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
> +	struct clk **cix_usb_clks = data->cix_usb_clks;
> +
> +	for_each_set_bit(i, &mask, CIX_USB_CLK_NUM) {
> +		if (test_and_set_bit(i, &data->clks_enabled))
> +			continue;
> +
> +		ret = clk_prepare_enable(cix_usb_clks[i]);
> +		if (ret) {
> +			clear_bit(i, &data->clks_enabled);
> +			dev_err(dev, "failed to enable clock %s: %d\n",
> +				cix_usb_clk_names[i], ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * cdnsp_sky1_clk_disable() - disable the clocks selected by @mask
> + * @dev:	Pointer to the device of platform_device
> + * @mask:	Bit mask of the clocks to disable
> + *
> + * Only clocks that are recorded as enabled are disabled, so the enable
> + * and prepare counts cannot underflow after a partial enable or resume.
> + */
> +
> +static void cdnsp_sky1_clk_disable(struct device *dev, unsigned long mask)
> +{
> +	int i;
> +	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
> +	struct clk **cix_usb_clks = data->cix_usb_clks;
> +
> +	for_each_set_bit(i, &mask, CIX_USB_CLK_NUM) {
> +		if (!test_and_clear_bit(i, &data->clks_enabled))
> +			continue;
> +
> +		clk_disable_unprepare(cix_usb_clks[i]);
> +	}
> +}
> +
> +/**
> + * cdnsp_sky1_clk_enable_all() - get and enable all clocks of the controller
> + * @dev:	Pointer to the device of platform_device
> + *
> + */
> +
> +static int cdnsp_sky1_clk_enable_all(struct device *dev)
> +{
> +	int i, ret = 0;
> +	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
> +	struct clk **cix_usb_clks = data->cix_usb_clks;
> +
> +	for (i = 0; i < CIX_USB_CLK_NUM; i++) {
> +		cix_usb_clks[i] = devm_clk_get(dev, cix_usb_clk_names[i]);
> +		if (IS_ERR(cix_usb_clks[i]))
> +			return dev_err_probe(dev, PTR_ERR(cix_usb_clks[i]),
> +					     "could not get %s clock\n",
> +					     cix_usb_clk_names[i]);
> +	}
> +
> +	ret = cdnsp_sky1_clk_enable(dev, CIX_USB_CLK_ALL_MASK);
> +	if (ret)
> +		cdnsp_sky1_clk_disable(dev, CIX_USB_CLK_ALL_MASK);
> +
> +	dev_dbg(dev, "enable sky1 USB clock done\n");
> +	return ret;
> +}
> +
> +/**
> + * cdnsp_sky1_clk_disable_all() - disable all clocks for usb controller
> + * @dev:	Pointer to the device of platform_device
> + *
> + */
> +
> +static void cdnsp_sky1_clk_disable_all(struct device *dev)
> +{
> +	cdnsp_sky1_clk_disable(dev, CIX_USB_CLK_ALL_MASK);
> +}
> +
> +/**
> + * cdnsp_sky1_clk_enable_resume() - enable the clocks that are turned
> + * off while suspend
> + * @dev:	Pointer to the device of platform_device
> + *
> + */
> +
> +static int cdnsp_sky1_clk_enable_resume(struct device *dev)
> +{
> +	return cdnsp_sky1_clk_enable(dev, CIX_USB_CLK_SUSPEND_MASK);
> +}
> +
> +/**
> + * cdnsp_sky1_clk_disable_suspend() - disable the clocks which are not
> + * needed when suspend
> + * @dev:	Pointer to the device of platform_device
> + *
> + */
> +
> +static void cdnsp_sky1_clk_disable_suspend(struct device *dev)
> +{
> +	cdnsp_sky1_clk_disable(dev, CIX_USB_CLK_SUSPEND_MASK);
> +}
> +
> +static u32 sky1_rcsu_read_status(struct cdnsp_sky1 *data)
> +{
> +	return readl(data->rcsu_base + data->rcsu_status_offset);
> +}
> +
> +static int sky1_rcsu_handshake(struct cdnsp_sky1 *data, u32 mask, u32 done,
> +			       u64 timeout_us)
> +{
> +	u32	result;
> +	int	ret;
> +
> +	ret = readl_poll_timeout(data->rcsu_base + data->rcsu_status_offset,
> +				 result,
> +				 (result & mask) == done ||
> +				 result == U32_MAX,
> +				 10, timeout_us);
> +	if (result == U32_MAX)		/* card removed */
> +		return -ENODEV;
> +	return ret;
> +}
> +
> +static int cdns_sky1_platform_suspend(struct device *dev,
> +				      bool suspend, bool wakeup)
> +{
> +	struct cdns *cdns = dev_get_drvdata(dev);
> +	struct platform_device *xhci_dev = cdns->host_dev;
> +	struct usb_hcd  *hcd;
> +	struct device *parent = cdns->dev->parent;
> +	struct cdnsp_sky1 *data = dev_get_drvdata(parent);
> +	u32 value;
> +	int poll;
> +	int ret = 0;
> +	int count = 3;
> +
> +	if (cdns->role != USB_ROLE_HOST)
> +		return 0;
> +
> +	if (!xhci_dev) {
> +		dev_dbg(dev, "host controller has not been registered\n");
> +		return 0;
> +	}
> +
> +	hcd = dev_get_drvdata(&xhci_dev->dev);
> +	if (!hcd) {
> +		dev_dbg(dev, "host controller have not registered\n");
> +		return 0;
> +	}
> +
> +	if (suspend) {
> +		while (count--) {
> +			value = readl(hcd->regs + XECP_PM_PMCSR);
> +			value &= ~PS_MASK;
> +			value |= PS_D3;
> +			if (wakeup)
> +				value |= PS_PME_En;
> +			else
> +				value &= ~PS_PME_En;
> +			writel(value, hcd->regs + XECP_PM_PMCSR);
> +			/* After controller enters D3, disable AXI and SOF
> +			 * until AXI valid flag changes to 0.
> +			 */
> +			if (sky1_rcsu_handshake(data, AXI_CLOCK_VALID, 0,
> +						100ULL * 1000)) {
> +				u32 ctst;
> +
> +				ctst = sky1_rcsu_read_status(data);
> +				dev_dbg(dev, "enter D3 failed, register value:%x\n",
> +					ctst);
> +			} else {
> +				break;
> +			}
> +		}
> +		if (count < 0) {
> +			u32 ctst;
> +
> +			ctst = sky1_rcsu_read_status(data);
> +			dev_err(dev, "enter D3 failed after retries, register value:%x\n",
> +				ctst);
> +			/*
> +			 * The controller never left D0, so it is not suspended:
> +			 * bring it back to D0 explicitly and make sure PME
> +			 * wakeup stays off instead of leaving it half way.
> +			 */
> +			value &= ~PS_MASK;
> +			value |= PS_D0;
> +			value &= ~PS_PME_En;
> +			writel(value, hcd->regs + XECP_PM_PMCSR);
> +			ret = -ETIMEDOUT;
> +		}
> +	} else {
> +		while (count--) {
> +			value = readl(hcd->regs + XECP_PM_PMCSR);
> +			value &= ~PS_MASK;
> +			value |= PS_D0;
> +			value &= ~PS_PME_En;
> +			writel(value, hcd->regs + XECP_PM_PMCSR);
> +			/* Wait power state back to D0 */
> +			poll = readl_poll_timeout(hcd->regs + XECP_PM_PMCSR,
> +						  value,
> +						  (value & PS_MASK) == 0,
> +						  10, 100ULL * 1000);
> +			if (poll) {
> +				dev_dbg(dev, "exit D3 timeout, power state=0x%lx\n",
> +					value & PS_MASK);
> +			} else {
> +				break;
> +			}
> +		}
> +		if (count < 0) {
> +			dev_err(dev, "exit D3 timeout after retries, power state=0x%lx\n",
> +				value & PS_MASK);
> +			ret = -ETIMEDOUT;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void cdnsp_sky1_configure_controller(struct cdnsp_sky1 *data)
> +{
> +	int clk;
> +	int v0, v1, v2, v3;
> +	u32 dev_cap, xhci_cap;
> +	u32 val = 0;
> +
> +	if (data->u3_disable) {
> +		dev_dbg(data->dev, "disable u3 port\n");
> +		writel(D_XEC_CFG_3XPORT_MODE_VALUE, data->device_base
> +			+ D_XEC_CFG_3XPORT_MODE);
> +	}
> +	dev_cap = readl(data->device_base + D_XEC_AXI_CAP);
> +	xhci_cap = readl(data->xhci_base + D_XEC_AXI_CAP);
> +	writel(dev_cap | AXI_HALT, data->device_base + D_XEC_AXI_CAP);
> +	writel(xhci_cap | AXI_HALT, data->xhci_base + D_XEC_AXI_CAP);
> +	writel(data->axi_bmax_value, data->device_base + D_XEC_AXI_CTRL0);
> +	writel(data->axi_bmax_value, data->xhci_base + D_XEC_AXI_CTRL0);
> +	writel(dev_cap & ~AXI_HALT, data->device_base + D_XEC_AXI_CAP);
> +	writel(xhci_cap & ~AXI_HALT, data->xhci_base + D_XEC_AXI_CAP);
> +	clk = data->sof_clk_freq;
> +	v0 =  25 * clk / 100000000;
> +	v1 = clk / 10000;
> +	v2 = clk / 10;
> +	v3 = 125 * clk / 1000000;
> +	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_250NS);
> +	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1),
> +	       data->device_base + D_XEC_PRE_REG_1US);
> +	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1),
> +	       data->device_base + D_XEC_PRE_REG_10US);
> +	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_100US);
> +	writel((unsigned int)(v3 > 1 ? v3 - 1 : 1),
> +	       data->device_base + D_XEC_PRE_REG_125US);
> +	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_1MS);
> +	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_10MS);
> +	writel((v2 > 1 ? v2 - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_100MS);
> +	dev_dbg(data->dev, "readl:%x, %x ,%x, %x, %x, %x, %x, %x\n",
> +		readl(data->device_base + D_XEC_PRE_REG_250NS),
> +		readl(data->device_base + D_XEC_PRE_REG_1US),
> +		readl(data->device_base + D_XEC_PRE_REG_10US),
> +		readl(data->device_base + D_XEC_PRE_REG_100US),
> +		readl(data->device_base + D_XEC_PRE_REG_125US),
> +		readl(data->device_base + D_XEC_PRE_REG_1MS),
> +		readl(data->device_base + D_XEC_PRE_REG_10MS),
> +		readl(data->device_base + D_XEC_PRE_REG_100MS));
> +	clk = data->lpm_clk_freq;
> +	v0 =  25 * clk / 100000000;
> +	v1 = clk / 10000;
> +	v2 = clk / 10;
> +	v3 = 125 * clk / 1000000;
> +	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
> +		+ D_XEC_LPM_PRE_REG_250NS);
> +	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1), data->device_base
> +		+ D_XEC_LPM_PRE_REG_1US);
> +	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1), data->device_base
> +		+ D_XEC_LPM_PRE_REG_10US);
> +	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
> +		+ D_XEC_LPM_PRE_REG_100US);
> +	writel((unsigned int)(v3 > 1 ? v3 - 1 : 1),
> +	       data->device_base + D_XEC_LPM_PRE_REG_125US);
> +	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 1), data->device_base
> +		+ D_XEC_LPM_PRE_REG_1MS);
> +	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 1), data->device_base
> +		+ D_XEC_LPM_PRE_REG_10MS);
> +	writel((v2 > 1 ? v2 - 1 : 1), data->device_base
> +		+ D_XEC_LPM_PRE_REG_100MS);
> +	v0 = readl(data->xhci_base + XEC_USBSSP_CHICKEN_BITS_3);
> +	v0 &= ~(CFG_APB_TIMEOUT_PSLVERR_EN | CFG_APB_PSLVERR_EN);
> +	writel(v0, data->xhci_base + XEC_USBSSP_CHICKEN_BITS_3);
> +	if (data->u3_disable) {
> +		dev_dbg(data->dev, "disable u3 port\n");
> +		writel(XEC_CFG_3XPORT_MODE_VALUE, data->xhci_base
> +			+ XEC_CFG_3XPORT_MODE);
> +	} else if (data->ssp_disable) {
> +		dev_dbg(data->dev, "disable ssp\n");
> +		v0 = readl(data->xhci_base + XEC_CFG_3XPORT_MODE);
> +		writel(v0  & CFG_3XPORT_MODE_DIS_SSP, data->xhci_base
> +			+ XEC_CFG_3XPORT_MODE);
> +	}
> +	clk = data->sof_clk_freq;
> +	v0 =  25 * clk / 100000000;
> +	v1 = clk / 10000;
> +	v2 = clk / 10;
> +	v3 = 125 * clk / 1000000;
> +	writel(((v0 > 1) ? v0 - 1 : 0), data->xhci_base
> +		+ XEC_PRE_REG_250NS);
> +	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 0), data->xhci_base
> +		+ XEC_PRE_REG_1US);
> +	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 0), data->xhci_base
> +		+ XEC_PRE_REG_10US);
> +	writel(((v1) > 1 ? v1 - 1 : 0), data->xhci_base
> +		+ XEC_PRE_REG_100US);
> +	writel((unsigned int)(v3 > 1 ? v3 - 1 : 0),
> +	       data->xhci_base + XEC_PRE_REG_125US);
> +	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 0), data->xhci_base
> +		+ XEC_PRE_REG_1MS);
> +	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 0), data->xhci_base
> +		+ XEC_PRE_REG_10MS);
> +	writel((v2 > 1 ? v2 - 1 : 0), data->xhci_base
> +		+ XEC_PRE_REG_100MS);
> +	clk = data->lpm_clk_freq;
> +	v0 =  25 * clk / 100000000;
> +	v1 = clk / 10000;
> +	v2 = clk / 10;
> +	v3 = 125 * clk / 1000000;
> +	writel(((v0 > 1) ? v0 - 1 : 0), data->xhci_base
> +		+ XEC_LPM_PRE_REG_250NS);
> +	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 0), data->xhci_base
> +		+ XEC_LPM_PRE_REG_1US);
> +	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 0), data->xhci_base
> +		+ XEC_LPM_PRE_REG_10US);
> +	writel(((v1) > 1 ? v1 - 1 : 0), data->xhci_base
> +		+ XEC_LPM_PRE_REG_100US);
> +	writel((unsigned int)(v3 > 1 ? v3 - 1 : 0),
> +	       data->xhci_base + XEC_LPM_PRE_REG_125US);
> +	writel(((v2 / 100 > 1) ? (v2 / 100) - 1 : 0), data->xhci_base
> +		+ XEC_LPM_PRE_REG_1MS);
> +	writel(((v2 / 10 > 1) ? (v2 / 10) - 1 : 0), data->xhci_base
> +		+ XEC_LPM_PRE_REG_10MS);
> +	writel((v2 > 1 ? v2 - 1 : 0), data->xhci_base
> +		+ XEC_LPM_PRE_REG_100MS);
> +	val = readl(data->xhci_base + XEC_USBSSP_CLK_GATING_CTRL);
> +	val |= HOST20_ACLK_GATING_DISABLE | HOST20_UTMI_GATING_DISABLE;
> +	writel(val, data->xhci_base + XEC_USBSSP_CLK_GATING_CTRL);
> +}
> +
> +static int cdnsp_sky1_drd_init(struct cdnsp_sky1 *data)
> +{
> +	int ret = 0;
> +
> +	reset_control_assert(data->reset);
> +	reset_control_assert(data->preset);
> +	ret = cdnsp_sky1_clk_enable_all(data->dev);
> +	if (ret)
> +		return ret;
> +	writel(CIX_USB_AXI_WR_CACHE_VALUE, data->rcsu_base);
> +	cdnsp_sky1_set_mode(data->dev, MODE_STRAP_OTG);
> +	reset_control_deassert(data->preset);
> +	cdnsp_sky1_configure_controller(data);
> +	reset_control_deassert(data->reset);
> +	return ret;
> +}
> +
> +static void __iomem *sky1_of_get_addr_by_name(struct device_node *parent, const char *name)
> +{
> +	void __iomem *addr = NULL;
> +	struct device_node *node;
> +	int index;
> +
> +	for_each_child_of_node(parent, node) {
> +		index = of_property_match_string(node, "reg-names", name);
> +		if (index >= 0) {
> +			addr = of_iomap(node, index);
> +			of_node_put(node);
> +			break;
> +		}
> +	}
> +
> +	return addr;
> +}
> +
> +static void __iomem *sky1_get_addr_by_name(struct device *dev, const char *name)
> +{
> +	return sky1_of_get_addr_by_name(dev->of_node, name);
> +}
> +
> +static void sky1_put_addr(void __iomem *regs)
> +{
> +	if (regs)
> +		iounmap(regs);
> +}
> +
> +struct sky1_usbssp_cfg {
> +	unsigned int rcsu_status_offset;
> +};
> +
> +/* Offset of STRAP_STATUS0, the AXI clock status register, from 0x91c0314. */
> +static const struct sky1_usbssp_cfg sky1_usbssp_typea_cfg = {
> +	.rcsu_status_offset = 0xec,
> +};
> +
> +/*
> + * platform_device_release() frees the platform data of the device it is
> + * called for, while of_platform_populate() neither fails nor reports how many
> + * devices it created. The device tree therefore has to describe exactly one
> + * enabled core node: with none the platform data would leak, with two it
> + * would be freed twice.
> + */
> +static int cdnsp_sky1_check_children(struct device *dev)
> +{
> +	struct device_node *node;
> +	int count = 0;
> +
> +	for_each_child_of_node(dev->of_node, node) {
> +		if (of_device_is_available(node) &&
> +		    of_device_is_compatible(node, "cdns,usb3"))
> +			count++;
> +	}
> +
> +	if (count != 1)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "expected one enabled \"cdns,usb3\" child, found %d\n",
> +				     count);
> +
> +	return 0;
> +}
> +
> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct of_dev_auxdata cdns_sky1_auxdata[] = {
> +		{ .compatible = "cdns,usb3", },
> +		{},
> +	};
> +	const struct sky1_usbssp_cfg *cfg;
> +	struct cdnsp_sky1 *data;
> +	struct cdns3_platform_data *cdns_sky1_pdata;
> +	struct resource *res;
> +	unsigned int args[2];
> +	int ret = 0;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	cfg = of_device_get_match_data(dev);
> +	if (!cfg)
> +		return dev_err_probe(dev, -ENODEV, "unsupported device\n");
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return dev_err_probe(dev, -ENODEV, "missing register range\n");
> +	ret = cdnsp_sky1_check_children(dev);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * The two Type-A controllers share one RCSU block and their
> +	 * register ranges overlap, so the range is mapped without
> +	 * requesting it: request_mem_region() would make the second
> +	 * controller fail with -EBUSY.
> +	 */
> +	data->rcsu_base = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!data->rcsu_base)
> +		return dev_err_probe(dev, -ENOMEM, "failed to map registers\n");
> +	data->rcsu_status_offset = cfg->rcsu_status_offset;
> +	data->reset = devm_reset_control_get_exclusive(&pdev->dev, "core");
> +	if (IS_ERR(data->reset))
> +		return dev_err_probe(dev, PTR_ERR(data->reset),
> +				     "failed to get core reset\n");
> +	data->preset = devm_reset_control_get_exclusive(&pdev->dev, "apb");
> +	if (IS_ERR(data->preset))
> +		return dev_err_probe(dev, PTR_ERR(data->preset),
> +				     "failed to get APB reset\n");
> +	platform_set_drvdata(pdev, data);
> +	data->dev = dev;
> +	data->usb_syscon =
> +		syscon_regmap_lookup_by_phandle_args(node, "cix,usb-syscon",
> +						     2, args);
> +	if (IS_ERR(data->usb_syscon))
> +		return dev_err_probe(dev, PTR_ERR(data->usb_syscon),
> +				     "failed to get S5 system controller\n");
> +	data->strap_offset = args[0];
> +	data->strap_bit = args[1];
> +	data->u3_disable = device_property_read_bool(dev, "cix,u3-port-disable");
> +	data->ssp_disable = device_property_read_bool(dev, "cix,ssp-disable");
> +	data->sof_clk_freq = CIX_USB_CLK_8M;
> +	data->lpm_clk_freq = CIX_USB_CLK_32K;
> +	data->axi_bmax_value = AXI_BMAX_VALUE_DEFAULT;
> +	data->xhci_base = sky1_get_addr_by_name(dev, "xhci");
> +	if (!data->xhci_base) {
> +		ret = -ENODEV;
> +		goto err_put_xhci;
> +	}
> +	data->device_base = sky1_get_addr_by_name(dev, "dev");
> +	if (!data->device_base) {
> +		ret = -ENODEV;
> +		goto err_put_addrs;
> +	}
> +	ret = cdnsp_sky1_drd_init(data);
> +	if (ret == -ETIMEDOUT)
> +		ret = -EPROBE_DEFER;
> +	if (ret) {
> +		/*
> +		 * drd_init() leaves the clocks disabled and the resets
> +		 * asserted on failure; only the address mappings are
> +		 * left to release.
> +		 */
> +		goto err_put_addrs;
> +	}
> +	/*
> +	 * platform_device_release() kfree()s dev.platform_data, so this
> +	 * buffer belongs to the child device once it is created. It cannot be
> +	 * devm-managed. cdnsp_sky1_check_children() guarantees that exactly one
> +	 * child takes it over, so it is not released here, not even on failure:
> +	 * a child that was created and then failed to register frees it on its
> +	 * own.
> +	 */
> +	cdns_sky1_pdata = kzalloc(sizeof(*cdns_sky1_pdata), GFP_KERNEL);
> +	if (!cdns_sky1_pdata) {
> +		ret = -ENOMEM;
> +		goto err_quiesce;
> +	}
> +	cdns_sky1_pdata->platform_suspend = cdns_sky1_platform_suspend;
> +	cdns_sky1_pdata->quirks = CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
> +	cdns_sky1_auxdata[0].platform_data = cdns_sky1_pdata;
> +	ret = of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to create children: %d\n", ret);
> +		goto err_quiesce;
> +	}
> +	device_set_wakeup_capable(dev, true);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	return 0;
> +
> +err_quiesce:
> +	reset_control_assert(data->reset);
> +	reset_control_assert(data->preset);
> +	cdnsp_sky1_clk_disable_all(dev);
> +err_put_addrs:
> +	sky1_put_addr(data->device_base);
> +err_put_xhci:
> +	sky1_put_addr(data->xhci_base);
> +	return ret;
> +}
> +
> +static void cdnsp_sky1_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
> +
> +	pm_runtime_get_sync(dev);
> +	of_platform_depopulate(dev);
> +	sky1_put_addr(data->xhci_base);
> +	sky1_put_addr(data->device_base);
> +	reset_control_assert(data->reset);
> +	reset_control_assert(data->preset);
> +	cdnsp_sky1_clk_disable_all(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_put_noidle(dev);
> +}
> +
> +static int cdnsp_sky1_find_cdns_dev(struct device *dev, void *data)
> +{
> +	struct device **cdns_dev = data;
> +
> +	if (dev->of_node && of_device_is_compatible(dev->of_node, "cdns,usb3")) {
> +		/* keep a reference: the pointer is used after the iteration */
> +		*cdns_dev = get_device(dev);
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * The resets are left alone here. Asserting them throws away the OTG
> + * registers programmed by cdns_drd_init(), and nothing programs them again
> + * after the child device resumes, so the controller keeps its state across
> + * system suspend and only the clocks are gated.
> + */
> +static int cdnsp_sky1_system_suspend(struct device *dev)
> +{
> +	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
> +	struct device *cdns_dev = NULL;
> +
> +	/*
> +	 * The wake-up interrupt and the host interrupt are the same interrupt,
> +	 * so gating the axi and sof clocks takes the port status change
> +	 * interrupt away. Keep the clocks running when the child device, which
> +	 * owns the interrupt, is armed for wakeup.
> +	 */
> +	device_for_each_child(dev, &cdns_dev, cdnsp_sky1_find_cdns_dev);
> +	if (cdns_dev) {
> +		bool wakeup = device_may_wakeup(cdns_dev);
> +
> +		put_device(cdns_dev);
> +		if (wakeup)
> +			return 0;
> +	}
> +
> +	/*
> +	 * cdns_sky1_platform_suspend() only asks for D3 in host role, so in
> +	 * device or idle OTG role, and when the D3 entry timed out, the
> +	 * controller is still clocked and its register interface is in use.
> +	 * Gate the clocks only once AXI_CLOCK_VALID has dropped.
> +	 */
> +	if (sky1_rcsu_read_status(data) & AXI_CLOCK_VALID)
> +		return 0;
> +
> +	cdnsp_sky1_clk_disable_suspend(dev);
> +
> +	return 0;
> +}
> +
> +static int cdnsp_sky1_system_resume(struct device *dev)
> +{
> +	return cdnsp_sky1_clk_enable_resume(dev);
> +}
> +
> +static const struct dev_pm_ops cdnsp_sky1_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(cdnsp_sky1_system_suspend, cdnsp_sky1_system_resume)
> +};
> +
> +static const struct of_device_id cdns_sky1_of_match[] = {
> +	{
> +		.compatible = "cix,sky1-usbssp",
> +		.data = &sky1_usbssp_typea_cfg,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cdns_sky1_of_match);
> +
> +static void cdnsp_sky1_shutdown(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cdnsp_sky1 *data = dev_get_drvdata(dev);
> +	struct device *cdns_dev = NULL;
> +
> +	/*
> +	 * The wakeup interrupt and the host interrupt are the same one, so
> +	 * the controller has to stay alive when wakeup is enabled on the
> +	 * child device, which is the one that owns the interrupt.
> +	 */
> +	device_for_each_child(dev, &cdns_dev, cdnsp_sky1_find_cdns_dev);
> +	if (cdns_dev && device_may_wakeup(cdns_dev)) {
> +		put_device(cdns_dev);
> +		return;
> +	}
> +
> +	/*
> +	 * Same teardown as remove(): depopulate the child while its clocks
> +	 * are still on, so that its driver stops the controller and frees
> +	 * the interrupts before the resets and the clocks are taken away.
> +	 */
> +	pm_runtime_get_sync(dev);
> +	of_platform_depopulate(dev);
> +	reset_control_assert(data->reset);
> +	reset_control_assert(data->preset);
> +	cdnsp_sky1_clk_disable_all(dev);
> +	pm_runtime_put_noidle(dev);
> +	put_device(cdns_dev);
> +}
> +
> +static struct platform_driver cdnsp_sky1_driver = {
> +	.probe		= cdnsp_sky1_probe,
> +	.remove		= cdnsp_sky1_remove,
> +	.shutdown	= cdnsp_sky1_shutdown,
> +	.driver		= {
> +		.name	= "cdnsp-sky1",
> +		.of_match_table	= cdns_sky1_of_match,
> +		.pm	= pm_sleep_ptr(&cdnsp_sky1_pm_ops),
> +	},
> +};
> +
> +module_platform_driver(cdnsp_sky1_driver);
> +
> +MODULE_ALIAS("platform:cdnsp-sky1");
> +MODULE_DESCRIPTION("CIX Sky1 Cadence USBSSP DRD glue driver");
> +MODULE_AUTHOR("Hongliang Yang <hongliang.yang@cixtech.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/usb/cdns3/cdnsp-sky1.h b/drivers/usb/cdns3/cdnsp-sky1.h
> new file mode 100644
> index 000000000000..d70019e2ba95
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _CDNSP_SKY1_H
> +#define _CDNSP_SKY1_H
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +#include <linux/types.h>
> +
> +#define MODE_STRAP_OTG                  0
> +
> +#define AXI_HALT                        BIT(31)
> +#define AXI_BMAX_VALUE_DEFAULT          0x7
> +
> +#define D_XEC_CFG_3XPORT_MODE           0x2040
> +#define D_XEC_AXI_CAP                   0x2174
> +#define D_XEC_AXI_CTRL0                 0x217C
> +#define D_XEC_PRE_REG_250NS             0x21E8
> +#define D_XEC_PRE_REG_1US               0x21EC
> +#define D_XEC_PRE_REG_10US              0x21F0
> +#define D_XEC_PRE_REG_100US             0x21F4
> +#define D_XEC_PRE_REG_125US             0x21F8
> +#define D_XEC_PRE_REG_1MS               0x21FC
> +#define D_XEC_PRE_REG_10MS              0x2200
> +#define D_XEC_PRE_REG_100MS             0x2204
> +#define D_XEC_LPM_PRE_REG_250NS         0x2208
> +#define D_XEC_LPM_PRE_REG_1US           0x220C
> +#define D_XEC_LPM_PRE_REG_10US          0x2210
> +#define D_XEC_LPM_PRE_REG_100US         0x2214
> +#define D_XEC_LPM_PRE_REG_125US         0x2218
> +#define D_XEC_LPM_PRE_REG_1MS           0x221C
> +#define D_XEC_LPM_PRE_REG_10MS          0x2220
> +#define D_XEC_LPM_PRE_REG_100MS         0x2224
> +
> +#define XEC_CFG_3XPORT_MODE             0x2040
> +#define XEC_PRE_REG_250NS               0x21E8
> +#define XEC_PRE_REG_1US                 0x21EC
> +#define XEC_PRE_REG_10US                0x21F0
> +#define XEC_PRE_REG_100US               0x21F4
> +#define XEC_PRE_REG_125US               0x21F8
> +#define XEC_PRE_REG_1MS                 0x21FC
> +#define XEC_PRE_REG_10MS                0x2200
> +#define XEC_PRE_REG_100MS               0x2204
> +#define XEC_LPM_PRE_REG_250NS           0x2208
> +#define XEC_LPM_PRE_REG_1US             0x220C
> +#define XEC_LPM_PRE_REG_10US            0x2210
> +#define XEC_LPM_PRE_REG_100US           0x2214
> +#define XEC_LPM_PRE_REG_125US           0x2218
> +#define XEC_LPM_PRE_REG_1MS             0x221C
> +#define XEC_LPM_PRE_REG_10MS            0x2220
> +#define XEC_LPM_PRE_REG_100MS           0x2224
> +#define XEC_USBSSP_CHICKEN_BITS_3       0x2230
> +#define XEC_USBSSP_CLK_GATING_CTRL      0x2234
> +#define XECP_PM_PMCSR                   0x2240
> +
> +/* XEC_USBSSP_CLK_GATING_CTRL */
> +#define HOST20_ACLK_GATING_DISABLE      BIT(4)
> +#define HOST20_UTMI_GATING_DISABLE      BIT(5)
> +
> +/* XECP_PM_PMCSR */
> +#define PS_MASK                         GENMASK(1, 0)
> +#define PS_D0                           0
> +#define PS_D3                           3
> +#define PS_PME_En                       BIT(8)
> +
> +#define D_XEC_CFG_3XPORT_MODE_VALUE     0xa0031e07
> +#define XEC_CFG_3XPORT_MODE_VALUE       0xa0031e07
> +#define CFG_3XPORT_MODE_DIS_SSP         (~BIT(31))
> +
> +#define CFG_APB_TIMEOUT_PSLVERR_EN      BIT(22)
> +#define CFG_APB_PSLVERR_EN              BIT(23)
> +
> +#define CIX_USB_CLK_NUM                 (4)
> +/* Clocks that are gated while the controller is suspended */
> +#define CIX_USB_CLK_SUSPEND_MASK        (BIT(0) | BIT(1))
> +#define CIX_USB_CLK_ALL_MASK            GENMASK(CIX_USB_CLK_NUM - 1, 0)
> +#define CIX_USB_AXI_WR_CACHE_VALUE      0x33
> +#define CIX_USB_CLK_32K                 32000
> +#define CIX_USB_CLK_8M                  8000000
> +
> +#define AXI_CLOCK_VALID                 BIT(1)
> +
> +struct cdnsp_sky1 {
> +	struct device *dev;
> +	void __iomem *rcsu_base;
> +	unsigned int rcsu_status_offset;
> +	void __iomem *xhci_base;
> +	void __iomem *device_base;
> +	struct reset_control *reset;
> +	struct reset_control *preset;
> +	struct clk *cix_usb_clks[CIX_USB_CLK_NUM];
> +	unsigned long clks_enabled;
> +	unsigned int strap_offset;
> +	unsigned int strap_bit;
> +	struct regmap	*usb_syscon;
> +	int lpm_clk_freq;
> +	int sof_clk_freq;
> +	bool u3_disable;
> +	bool ssp_disable;
> +	int axi_bmax_value;
> +};
> +
> +#endif /* _CDNSP_SKY1_H */
> -- 
> 2.54.0
> 
> 

-- 

Thanks,
Peter Chen
