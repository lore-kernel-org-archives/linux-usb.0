Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874017;
	b=lDGqP0wqcU1R6YyoKpXNtdWU9rH/SMUJMvgUnILLJarjCc+bbDinLVuPszoFzlJi21OX
	 btmuC3RxVGtFLLU/NBt2IpXv8IeIQQmcUIJyPhadnVYxeb6H4u74YB896QyMvFIedakbU
	 5rzQtDQk1ObipCm4FkkMq8Fhxz/Qm22HkKifnPbzhjtRW1mrS0yasKREBc459LKxxB+yl
	 ZgjDgYvnucE+mEW2iRpvflCqRqZWgy605Usum36g90mJTAgdlhXnZ6uK2fer6sCHk/do5
	 6tBFq7eO4BPwcs8ovdIVagY+6WunUGzd6RlYkwAhJMbE6Yf6sqali3syNAWvYup4F4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vs3y/71dKjCbst3P56TUv3LsJ2zzrgRXRjjiJF3SkBE=;
	b=0ZtKaWnHHenI5n8qS4Y+eE/pl4uChu2Ir1OW/DgSguW5yP84FMAYw1cQPKgq0ZCqRKw4
	 P7gd7oWyWPcOcdVyuXdgpPymPLFIhg4CrjZLKUT3LLh1xowEJbEefexJW8E7gqxBgxJ3i
	 8KsRs4ROTDttQMoXN5OThWj1SCr3GehGT9S4V0a23efXO6/ufWjeo4JhnG5McAF55y+1L
	 6E4+XlZ4WW3yH5VGgKYZymUbOK/hBBvDn4rLD8FmDIMPfEGsz4gH6wBPmP1t7GpgmBLjI
	 gF4DIiIXGuq2eJ7uUUGYCdo0cQwtrUfJdxlXWuXUkn72UnON2s2n0nGHNPjQ1XxCdPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgS5WvZe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CvIGhVkH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40F606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C40F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgS5WvZe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CvIGhVkH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGNQ4Rb1390498
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vs3y/71dKjCbst3P56TUv3LsJ2zzrgRXRjjiJF3SkBE=; b=RgS5WvZeHTrhLAFu
	9hk++n69ynxD4vYmv44gThtrHe884Yb27ZL0U2IUisC/2Rb0qUDbQYFuotdTT2iO
	88o3HB7J10HMJwQGvT7HKgVj3PkzmZuepb/1hXyV9InQ/hOaxnw3QXR/DDYyPCmH
	j9kqOq9a23RLeoJ5y/SHN0+GRc+WIJrW2yx0Huv9a+PClmDSm878fKCAjQGSoj0l
	1JnJkIg8Z2hLybYMf/36yu2pJAK8vc2qJ/cX9O1nD1ZNYpeU3Vr/UabUvL5gOLPN
	CO9N0DRoJtbWhLA5DqdqGUvFDtizPwOKusFoc2vI5vv4DeEtH6L9bDqj7Ev9Rw9J
	5Um6/g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y295s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:06:55 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3a348a6dbso3676097c88.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 16:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794874015; x=1795478815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs3y/71dKjCbst3P56TUv3LsJ2zzrgRXRjjiJF3SkBE=;
        b=CvIGhVkHusIQTor0AlhkAcmw35elrYQoBAOksY/oqo5PMG6vk1dvSmIKGqB3/C+Lt0
         9IdcvTtjtZtnnny5VHbrKpLfRU6+bjf+GIPw7LZb/90gVXdWpbl1WCSb7Qkm7PAQqrss
         19ict/Ly0GKmeeEH15hVuXYvuWglkP1ldU9l+EPCoz+nAQRCqTlNcIirpv/LsahdyCub
         KxlrAHIvVgvdJhW1cdLxCaBTp7elAyuUPrGt/cG1Ym1wubGoRcREu8+PJTvfI0nXYJLr
         OK/qMlsAC2GFcnLYRUE8rw7uH5TbBHQMHRSrtdDf/DIrtbAB5ytfu1VM2MCBMYJVo9TY
         iCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874015; x=1795478815;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs3y/71dKjCbst3P56TUv3LsJ2zzrgRXRjjiJF3SkBE=;
        b=te6qOlyMD0ikW4dOpU9PSbc67b0yJDD+BWigweM4wJjhRMD8kbdBRJlt6B2xYUIskx
         cEXIt9P3GNyvSKdXFrosp0cJf1K7aDWYWy8hRtT5FoQQGr5MEkBwvMprgfhRkswPicNy
         3VZRnNkbsohhPnX3tX6u4R2gkWGrEqKFLejAsdK3fHbqqxQ5mEGp3LQ4KXPysP6pTrWz
         qN0h4gw3QsZFqVTEABWLRhanLlxlk10vdZnhcxnX8Uux7a/0OVpxfvSXBbyzl/DQDt1w
         8V5TrStLI9w8RQabBjm48CW7aWOMDLeDQISjcsIJcrj8Zku7mrPkWRdCc5SxvfsG+NMU
         la5A==
X-Forwarded-Encrypted: i=1; AL+hErEE2dvCmta4/MV3Z4CYa2scKgU2BwIJwuPxrHauxzKl0+ERgtMAv5yU9P9LZO9IaAYEnH2DxkmCtzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8SSMe0GIV82rW6w/0iubGk5d3K9b6kmLWpJjDeLnBpe9vpx9o
	vdAYHOldNqX14NQGYaAvtAFYaLPDzidrLeBH1PxTjjiLFAUZ3kFvE53qfJA+BnqEWwW2dThQZqd
	oC3wSda9uP1+K4mk15rcncH1YvB8lOmPok04QM0xv27W/Z2glYC/h5SQi+bq4rh4=
X-Gm-Gg: AYBFou0yyThr/r6aJHMCkU59IxADVgzhjkfptu18rDjYbQ4zQvuoo35v7fLtGD+StUx
	/Sm3rMyW6vj5JQX3lzXP5VPdhm+H7BocClO9sspkV5uO4jExYAM6KV0TrJE4tf2qjRb5wjStj6/
	hFi6aFCe5DJva78XtDGj/QDxUnVMxlsa41qKNKXbtLkCr75BYXqcrkzMzF3FbetzIkBF220+91O
	RnHrcfucW6fYdMIc76EAXzQjT2nqABKLA1PvB78WO9hH83TywZnR4Ye1qYZiNoGNtPWPk4VN+HL
	nz8+h1+g9Rut22YD1PQK4FP4xxyY5wATlyvbC5YlhsRV/4NXLIwbOWGDCv/EDvbcRP0B8lvU+qZ
	QA0XKLqva7bhBm0oElYFOCmXS0su8zqRwt0SvOpT2FHJAYTUlZjiocgsZN2dh2kZwlPfkhynhZb
	xgHSo=
X-Received: by 2002:a05:701a:844d:20b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b50312ef36mr12287599c88.19.1794874014861;
        Mon, 16 Nov 2026 16:06:54 -0800 (PST)
X-Received: by 2002:a05:701a:844d:20b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b50312ef36mr12287574c88.19.1794874014237;
        Mon, 16 Nov 2026 16:06:54 -0800 (PST)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm38946650c88.14.2026.11.16.16.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 16:06:53 -0800 (PST)
Message-ID: <57c5aa78-a116-45d4-ab32-772cd970e6f6@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:06:52 -0800
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
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LKkioha0h1t9FZvCdRq63lH4XPzYpZlc
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb9a9f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=x2ix5JWDKEpZ5n-YOzEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: LKkioha0h1t9FZvCdRq63lH4XPzYpZlc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAwMCBTYWx0ZWRfX0ZvStBHaZlqs
 5lN+HtMzJU3l/X0Q6vId+It/U7u4UrssJjDkK5FQY9nkyQnqjBvfBKjfkxQk7zGjT1zMt3pQ04w
 cts+eO5DksCCLec1wZQn5rU5gB0qqBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAwMCBTYWx0ZWRfXzVWq2nmCmLg6
 xFGQsW3O8zPiMFi5t3Va838NJ3w6q/kRWIsC6/rXzdo000g2g1Myfg7LdSXswksMOyG8RFpb/5G
 SmlLreA+SAeOt6e3szXHDpfsjtWDs95Sz+6AuAZ1A+rkIedw9TpIOBMkgVfEs/EyQnx21m5B9l2
 7vmB/Rc2tUzId/N1pk2Czym99Ao/YgXzhhfAiW2PA7JGhXmW3tA5AVjynmFd/OGNbhDsPM6OiEi
 mctLewNCooiiQrve5AWIYpa4256mQRKvlu6MwQoPCJQ7X5Rw046NPznijRHBNVjCrJoXpNjSQ8t
 xLZsSzFoAPnsBGCdeMPp1a6Guhbya/gUDCf/CxDAUKIQe1Maopjnso6a8WzAX3wX24v5ZTge2Nv
 TISktXZJb1FOsa1yIq7UTvkBzizRAAzXawVA6P2gv2dYCpl4O//fyCb1on4Nz18JiiJkxWlWv48
 ki8POR1MFFtEjodpj1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170000

Hi Greg,

When you get a chance, could you please pick up patches 1-7 for the USB tree if everything looks good on your end? 

If these patches are already in your pipeline, please disregard this message.

Thanks,
Elson

On 9/29/2026 2:35 PM, Elson Serrao wrote:
> The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
> provides debug and trace capabilities on Qualcomm platforms. The current
> EUD driver, however, lacks essential hardware resources such as PHY
> references and support for multi-port configurations. This series
> addresses those gaps and introduces the necessary device tree updates
> to enable testing and validation of the enhanced functionality.
> 
> Below is a high-level block diagram showing the EUD and its connections.
> 
> 
> 			              EUD Block
>  	                   +------------------------------+  
> 			   |                              |
> [Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
> 			   |                              |  
> [Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> The series has been validated on the Qualcomm Dragonwing Q6 platform
> (RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> Testing feedback:
>  - Konrad Dybcio reported running a slightly modified version of this
>    series on Agatti with no obvious issues:
>    https://lore.kernel.org/all/8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com/
> 
> Regards,
> Elson
> 
> ---
> Changes in v9:
>  - [Patch 0002] Initialize port_idx from the hardware EUD_REG_PORT_SEL
>    register in probe(sashiko bot).
>  - [Patch 0003] Fall back to primary if the hardware-selected port has no
>    matching devicetree path.
>  - [Patch 0004] Add missing of_node_get()/of_node_put() to keep the fwnode
>    valid for the lifetime of the registered role switch (sashiko bot).
>  - [Patch 0006] Avoid mixing goto with guard(mutex) per convention (sashiko bot)
>  - [Patch 0008] Reorder eud_con label references alphabetically(Konrad)
>    and extend this routing to newly added sm7325-xiaomi-lisa board file.
>  - Link to v8: https://lore.kernel.org/all/20260912225301.3396556-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v8:
>  - [Patch 0001] Require '#address-cells' and '#size-cells' for eud-path
>    nodes to address Sashiko bot feedback. 
>  - [Patch 0004] Set path->curr_role before forwarding the role request to
>    the controller, as it reflects EUD's view of the role rather than the
>    controller's outcome. This also addresses Sashiko feedback regarding
>    EUD hardware potentially remaining enabled when the controller fails
>    to complete the role switch. 
>  - [Patch 0006] Acquire the lock in different execution paths to avoid
>    potential races.
>  - Link to v7: https://lore.kernel.org/all/20260831030147.1500616-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v7:
>  - [Patch 0001] Explicitly disallow the legacy ports representation for
>    SM8350, as pointed out by sashiko bot.
>  - [Patch 0004] Simplify fixed-role handling by relying on dr_mode directly
>    instead of an indirect USB_ROLE_NONE check (Konrad).
>  - [Patch 0008] Squash the Kodiak EUD board endpoint remap into this patch,
>    as applying it separately leaves the OF graph bidirectionality broken.
>  - Link to v6: https://lore.kernel.org/all/20260811213610.2956147-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v6:
>  - [Patch 0001] Fix oneOf schema to properly enforce mutual exclusivity
>    between 'ports' and 'eud-path@N' (sashiko-bot).
>  - [Patch 0009] Extend the eud_con remote-endpoint fix to
>    sm7325-motorola-dubai-common.dtsi and sm7325-xiaomi-taoyao.dts to fix
>    "not bidirectional" DT graph warning.
>  - Link to v5: https://lore.kernel.org/all/20260803031534.2942628-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v5:
>  - [Patch 0001] Add a compatible for a SoC that supports EUD over two
>    ports, restrict paths based on SoC hardware, and improve the commit
>    message [Krzysztof/Dmitry]
>  - [Patch 0002/0003] Document error codes in ABI doc.
>  - [Patch 0004] Zero-initialize the USB role switch descriptor [Peter].
>    Add a dr_mode check to handle cases where the USB controller
>    operates in a fixed role without role-switch support (based on
>    internal testing).
>  - [Patch 0006] Drop eud_disabled_for_host flag and control EUD based on
>    device role entry/exit [Peter]. Allow EUD to be powered on only in
>    device role and defer enablement in other roles until the port
>    switches to device role.
>  - Link to v4: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v4:
> - [Patch 0001] Restructure the flattened ports representation to a child-node
>   based model.
>   - Preserve the top-level 'ports' property and add per-path child nodes,
>     so that each role-switch path is described using its own OF graph.
>     (Dmitry).
>   - Link to the discussion leading to this design decision:
>     https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> - [Patch 0002] Use explicit port names when selecting the active EUD
>   port (Greg)
> - [Patch 0003] Use a scoped iterator when looping over child nodes and
>   drop redundant EUD path validation checks (Konrad). Preserve support
>   for the legacy top-level ports description.
> - [Patch 0004] Register role switch per path and forward the role switch
>   notifications to the USB controller.
> - [Patch 0006]  Add host mode co-ordination based on the role changes as
>   per the new design and drop the custom API that was used to get role
>   notifications.
> - [Patch 0008] Described the UTMI path as a child node with role switch
>   capability.
> - Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in RFC v3:
> - Replaced the per-path (eud-path@N) model with a flattened ports
>   representation based on the feedback.
> - Added port@2 and port@3 to support dual-port configurations.
> - Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
>   and role-switch information is obtained from walking the OF graph.
> - Updated PHY discovery logic by fetching the PHY from the controller
>   node/fwnode, and exported a new API for the controller to report role
>   changes. The dwc3-qcom driver now uses this API to notify EUD on role
>   transitions.
> - Updated the DTS structure by moving the EUD-to-controller port mapping
>   into the base SoC DTSI, enabling EUD by default, and adjusting all board
>   DTS files accordingly, including adding the usb-role-switch provider
>   link on connector nodes.
> - Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v2:
> - Improved commit message of patch 0001 and 0003 with historical context
>   on why EUD worked without PHY references on single-path systems.
>   Expanded the usb-role-switch property description in the bindings file.
> - Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
> ---
> 
> Elson Serrao (8):
>   dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
>   usb: misc: qcom_eud: add sysfs attribute for port selection
>   usb: misc: qcom_eud: add per-path High-Speed PHY control
>   usb: misc: qcom_eud: add per-path role switch support
>   usb: misc: qcom_eud: improve enable_store API
>   usb: misc: qcom_eud: add role-based EUD control
>   usb: misc: qcom_eud: fix virtual attach/detach event handling
>   arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector
>     mapping
> 
>  Documentation/ABI/testing/sysfs-driver-eud    |  19 +
>  .../bindings/soc/qcom/qcom,eud.yaml           | 138 ++++++-
>  arch/arm64/boot/dts/qcom/kodiak.dtsi          |  37 +-
>  .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
>  .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
>  .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
>  .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |  10 +-
>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
>  .../qcom/sm7325-motorola-dubai-common.dtsi    |  10 +-
>  .../boot/dts/qcom/sm7325-motorola-dubai.dts   |  10 +-
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
>  .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      |  10 +-
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  10 +-
>  drivers/usb/misc/qcom_eud.c                   | 369 ++++++++++++++++--
>  15 files changed, 577 insertions(+), 96 deletions(-)
> 
