Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594988;
	b=xUhbXyDwZ9XSGu1orjAa5x747/yIunLTd+Nemsns+Zh2lsplgcrQgSGmTsdgTV1sC0nF
	 dBYvqcLzKLKzjiNHx/7zGUh94iY7z+d6ucjRojv7x35k3hTlzQoZyVyjXCAoZE/hto5Lg
	 nJU6wjY+w/CIxe0VsNUupm7vovrVX3914Fbb4qfnf6S1IvDQKknvhhAiauNtv+wqucPE5
	 3ni3f+cn+OYIi/LMjQk0PjjhBDgt+IVX84sM+LvB6xVlrj7ns2z+YcIvNW7vderIpdLaE
	 yPjv/Alxx2mnLbE/LstSvwm+yOYjLzj/af08K4lmnhXRsh4QhZ/mH9LPYP6N4/vsQBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=;
	b=elxA0KmbS7zYRgU249Dx+B63h37weKu+I+lEHFTJdrtOTmsVYbTUaG2rJ+cAE6Nhk0ol
	 boSamKi9KKgyCmGY1aF3NyF+xNW4V5IuZeEigaCdjGJcxnELeWzjuSXq4Xm9QO5Gcm5hn
	 HN529ALHd7yOy4bYE8UFC7kFQkZ0341+H59PGJ7LDQ/KkCpJbfa3EEo9WlW3OObliJv9z
	 pIj8mktIuR2CLjXu0IaDZh1pVhJfkYHdIEFxQsPzRWp1RLV9FvkENzha6mOTrZRSdPvFp
	 2ux/gDa5vYxNbiQykHfpHF4bUEzPtpg2cW+xVFbSnIaPQ+7e5VoucwQnmAbLz5TZtUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qpttyn3k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Km79Bbxz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA2C606A324
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 04:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA2C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qpttyn3k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Km79Bbxz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vU1x2192510
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 04:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=; b=Qpttyn3kxX0Hh8Dk
	fGagTzx3Y4Z8uZGvGHrM2vtlVwzhM/9rvZDebUacJq+080vpIHmHnFEXewC+VZ3B
	5XDWzFY1nflBOn8+AQi1wUNaA068qKtwPfJxB9Xk5toDN/RhTCJH1M6yDuruXPG3
	zhdOvsQAd/r0Wu5H31jV21pSoLLBo3N3qyIn8sWGY94K0aagir379WxDNwYo4mjo
	bOgR7imbTbCZ9sRH9S5X0AmD+7MU4eITmT+qBgicv7vJM/xwJcOb5aZwINnhKOxo
	PRyvjsmifZydG8yFkClFkoMQVjn+GPvrROGRDLNxlugmwFoSrRqUfJ6/K3mD8MJN
	XhJAgQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93en170-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 04:49:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so1053089eec.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 20:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594986; x=1794199786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=;
        b=Km79Bbxz5ZD/Gwbm+QWpLFzfme/1pVxouw14Tu1pnMCPC60fXuDeGq0yQSrzKHaV9O
         VuACjMFoDAWojk0g1774OZ1E0wvlTqIh+Qs6mAJ31egOUxHynjg3M0+MxpIIsALrnGgD
         X32IIjOptGex30gn9dK2jdvf50rPY5oVdZI4ZDGUn9kL/543g0CsQ89l0DIetYi2jlaU
         HEpb4LZ9be1oNBbiYUjwpB7efTgTPI8CaLpnaK7wSlGgOGxv2IL2BXc5/iCgVe1jfKqb
         wjfzQ5TddiqeQMOjZnEqb5zLrfeTdjVJhmNiNjonQUwwOje7FXK0YGHdjTwaDK3+MN4D
         cGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594986; x=1794199786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haffvKFMOFavKnMtHa/0D3dVx0iUQlIqoA0qQXX2yGI=;
        b=aRGXcAeqhBIKRq/p0HHuUFDtikUXswZcbyxLCw66TkMZ1hPwtLZGg4HE/uQvJ6tRrJ
         ip5f0OJjt8n/JIifJ1jObFCVPzA1zRXfQN8jnE+aZMccXnu3j4OeVb9mVKbsf4cEUwZ0
         oNHUGIOgGSdcZptxHKeYnefWlYLLv8mGAAv105fPiv27ZAYQ0LH5tMjbhWCJD35XlrpP
         uBxVY1+T+GjvE26nkIGioT4ViM2ESTdEredQiykCmfDVSp1gXNWGyd9QghSgqDZ8Jjf4
         jiG0iM0qjV5NdLT75xI2zEHzmbeL6LZLs5g6wN8kJne3L3uNHyRpwA288c9X7b0gPh8T
         OXbg==
X-Forwarded-Encrypted: i=1; AKwUvBwwYbjXx4b/sUPDbcn893/nrDHpTXnWvPeDMNXdSS8H2HTtvxcJZpe1E4qTFRNdV10Q78fsXkzMQLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pkXWZlXfCsEmxRPCy22+JPQ+jpdFxg4F5DBOLKBnT4fkwRVDI
	/Nt1Dkk7UN/DqEENH6aENYquLuNyXC5lZPvTKzTwQHP4ZnP0UhX4ykYPoA3cFVM/WXiO3zWOWqP
	FUxTZNexzNPYhVCL7Xu6qyOArm1xokdeyXAQqjxT9G05S71s7ReeBOk9Gv+KzryA=
X-Gm-Gg: AYBFou2QSoGJmStwu3sClPqRflZScVY7iXRSYXUiUScChbo5w8LLkTR7LM9lgsFIlol
	zARUoTO1AZxtb9FnKn+7Se4JHcS/k+Ot4QsB9Pfk1ynT8xvhYFf/ThWchTPNCjJEfW9DSUrgytO
	6fRl6sMIrydwyNXCx3gM5vuMxXRpLqd/bY65bso22yuiRSvWTZTc6k943dXQYEFIYsDWxKBn6ur
	axWJpSCkfAiKvCGP1w1dZ7o+DogZbJ3f4VILcbHhP7pTiwo4ACiAdWg7+t1Tjc/kSFFiyRvPQpg
	z2tovK+wQTfd1wlj+Z0KEPsTRH9mkw4XTveRE/Bo6vtADW1Y6YPOH/ObIGcpLV9H1liuqUpe4CC
	2tpXxMgKF9w9dkqMchZ448bltUvY1ZNgqt/RKGfTz8hYkEIb8QpgwvG8th2+B1y1Ao95+450GWr
	hDVBG0SAUWllx2uWWP3CcO1CWUrIUjhmCOtAzFac8=
X-Received: by 2002:a05:693c:88c2:10b0:351:4866:255c with SMTP id 5a478bee46e88-36a42436c62mr14314563eec.32.1793594985785;
        Sun, 01 Nov 2026 20:49:45 -0800 (PST)
X-Received: by 2002:a05:693c:88c2:10b0:351:4866:255c with SMTP id 5a478bee46e88-36a42436c62mr14314520eec.32.1793594985107;
        Sun, 01 Nov 2026 20:49:45 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm35539336eec.20.2026.11.01.20.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:49:44 -0800 (PST)
Message-ID: <ba544091-1da4-4616-b1d5-fe23f32679d9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:19:40 +0530
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
Subject: Re: [PATCH v5 0/2] usb: dwc3: fixes for two connectors sharing one HS
 bus
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfXxTg1Ljw85xgu
 aI9OVFhVr+P7TaH9MTK6kZg82ZMwXg0sAJfBpfiYo8H4V3u4eOHIF3fYQDpyTOiNh5DZog6gGEX
 kCnRtHDluYKQTYKR7D4EC2kPz6YnULURssclZrWZ0i4dyR5IIkYdjLyEInCOfGqNuAnTjzKcBoC
 14BkCq2WDe01+R+5mZqXoAovNL/uxQuSsz1jbN4xpmTNakzm44/sOXT/VzdLAeDjA/zYXOuNjHi
 8glMxFkdY9QDQO60ha2Mu40/zW2NZkxHgnefr6GJ1P6bOnZiD5C6aJcGidZfE6b4Wtu3PwawcPm
 bZFCSr6tzkmJCAPJZtbEihKQesT39pkyd9YClyeTucaKesKBjUu/T9f7zcezIK5c9YrFbD29xYz
 /SLlQNYWAtDQDxj1lUlqrOCLsyu8ylZyKhib0kQUo5ezeYe8+11NMItlxlZgEpljHZXNoCHq3Ue
 xSXS2i28AgntFPT1a2Q==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae8166a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ONjVEaSHlnFtOruT_RoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: kHK9cR2u3o83kaPPWvkVaZxiin8Dy-3y
X-Proofpoint-GUID: kHK9cR2u3o83kaPPWvkVaZxiin8Dy-3y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxOSBTYWx0ZWRfX6616Zh+v2ZuL
 3pgP9btcFn0UUy/Dv+pdjiWQQgWAFw6oNgZIBbmYOcHJOAaiFFeMWHBwPPOiFIWCMwOO3ViC0jj
 bMxcvDNb+6tCIzEUdUdSgDoksaqfypc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020019



On 10/31/2026 8:31 PM, Qianhui Xu wrote:
> *** AI-assistance disclosure ***
> This cover letter and the accompanying patches were prepared with the help
> of an LLM coding assistant; the author reviewed, tested and takes full
> responsibility for the content. All measurements cited below come from real
> hardware runs and are reproducible with the commands referenced in our
> public reports.
> 
> Greetings,
> 
> This is v5.  It is a fixup series that applies *on top of* v4 [1] -- it
> does not replace v4 1/3..3/3, it fixes them in place:
> 

If v5 is being sent, it must not to be applied on top of v4. It must 
include (v4 + any additional changes/improvements).

Regards,
Krishna,

>    - 1/2 tightens the binding of v4 1/3 (snps,dwc3-common.yaml),
>    - 2/2 fixes the driver of v4 3/3 (usb: dwc3: support two connectors
>      sharing one HS data bus) and also corrects
>      usb_role_switch_at_endpoint() introduced by v4 2/3.
> 
> Base: v4 3/3 (fd69bd54e328, "usb: dwc3: support two connectors sharing
> one HS data bus").  Please apply v4 1/3..3/3 from lore [1] before this
> series; the `base-commit:` trailer in this posting is informational only,
> since it names a commit that is not in any public tree yet.
> 
> Hardware: Lenovo Legion Y700 (4th gen) tablet, SM8750.  Both High Speed
> connectors share one DWC3 controller; a port-select GPIO picks which
> connector owns the bus, and each connector has its own typec port with its
> own role switch, described per graph endpoint.
> 
> Changes since v4 (all points are replies to the automated review by
> Sashiko [2][3][4]; no human maintainer replied in the v4 thread yet):
> 
> Binding (Sashiko on v4 1/3, three Medium findings [2]):
> 
>    * "hs-port patternProperties does not match what the driver expects /
>      escapes unevaluatedProperties".  Fixed: the endpoint name pattern is
>      now the same one graph.yaml uses, so an unnumbered endpoint or
>      endpoint@2+ is validated too instead of silently escaping the
>      unevaluatedProperties: false rule (v5 1/2).
> 
>    * "usb-role-switch should not be required only indirectly".  Fixed: the
>      controller node must now carry "usb-role-switch" whenever
>      port-select-gpios is present.  This is a driver-fact fix, not just
>      schema cosmetics: without that property dwc3_get_dr_mode() forces
>      dr_mode back to peripheral and dwc3_drd_init() never runs, so a DT
>      that passed the old schema did not describe a DT the driver could act
>      on (v5 1/2).
> 
>    * "mux-state complementarity is not expressed".  Fixed: the two
>      independent `if: const: 0` blocks only rejected two zeroes; two
>      endpoints both claiming mux-state = <1> passed validation.  The pair
>      is now a single oneOf so exactly one assignment is accepted (v5 1/2).
> 
>    * On the standing question whether this should use the standard
>      mux-controls/mux-states properties instead of per-endpoint role
>      switches: kept the graph-endpoint shape for now.  Reason: the
>      arbitration is "earliest request wins" between two *typec connectors*
>      that must each be a usb role switch consumer, and the endpoint is the
>      fwnode the connector is attached to; a mux-control consumer does not
>      give us that per-connector identity.  drivers/usb/ has no
>      mux_control consumer today to follow as precedent.  Happy to reshape
>      if the DT maintainers prefer the standard property.
> 
> usb: roles (Sashiko on v4 2/3, one High finding [3]):
> 
>    * "-EPROBE_DEFER is swallowed by !IS_ERR_OR_NULL(sw)".  Fixed: pass the
>      error up, as suggested (v5 2/2, last hunk).  This was also the root
>      cause we hit on real hardware: the UCSI glue kept a NULL switch and
>      the connectors never bound.
> 
> usb: dwc3 (Sashiko on v4 3/3, five High + three Medium findings [4]):
> 
>    * "dwc3_set_mode() under dwc->lock self-deadlocks".  Fixed: request
>      decision and issue are now paired by mux->lock; dwc->lock is only held
>      while updating the individual fields (v5 2/2).
> 
>    * "glue layer is never notified".  Fixed: dwc3_pre_set_role() is called
>      with the effective role, outside spinlocks, before dwc3_set_mode(),
>      mirroring the single-connector path (v5 2/2).
> 
>    * "same-role request that moves the data path to the other connector".
>      Fixed: dwc3_set_prtcap() only clears SUSPHY when PRTCAP changes, so
>      that case now clears it explicitly (v5 2/2).
> 
>    * "registration earlier than the initial mode request races with a
>      connector driver".  Fixed: register and request the initial mode under
>      mux->lock, tear down in reverse order on failure (v5 2/2).
> 
>    * "fwnode references leak on error paths".  Fixed: dwc->role_mux is
>      published before the error paths that used to leak the endpoint
>      fwnodes, so dwc3_role_mux_exit() can actually unwind (v5 2/2).
> 
>    * "sticky mux->error is reported to the next caller after it already
>      committed its own request".  Fixed: the sticky value is dropped; a
>      failed data-path switch is logged and counted per connector (v5 2/2).
> 
>    * (found during on-device testing, same area) dwc3_mux_role_get()
>      returned USB_ROLE_NONE for a connector that did not own the data path,
>      hiding its pending request; the connector driver then never sent the
>      set_role(NONE) that would clear it, and the stale request kept winning
>      arbitration after unplug.  get() now reports the requested role
>      (v5 2/2).
> 
> Test evidence (all on the SM8750 tablet, kernel built from this series):
> 
>    - `git am --3way` of the whole series on top of v4 3/3 succeeds;
>      checkpatch --strict reports 0 errors / 0 warnings / 0 checks for both
>      patches.
>    - `dt-doc-validate` on snps,dwc3-common.yaml: clean.
>    - `make W=1 drivers/usb/dwc3/ drivers/usb/roles/` (arm64): 0 warnings.
>    - On device: after the -EPROBE_DEFER fix, /sys/class/typec shows port0,
>      port1 and a bound partner; with function_graph tracing, 12 consecutive
>      plug/unplug cycles each went usb_role_switch_set_role ->
>      dwc3_mux_role_set [dwc3] -> glue notifier -> dwc3_set_mode with zero
>      WARNING/BUG/lockdep splats, USB data and charging both stable
>      throughout.
>    - The binding topology (two HS connectors on port@0 and port@2 of the
>      controller's port node, one endpoint each, mux-state on the endpoint)
>      matches what the board DTS uses; port@1 is occupied by the SuperSpeed
>      path to the QMP PHY, which is why the two HS connectors are not
>      siblings under one port.
> 
> Known limitation, stated up front: the role *arbitration* detail (which
> connector wins a simultaneous request) is verified only by code reading and
> the stale-request test above; a dedicated per-port role-value trace is
> instrumented but its data set is not yet complete.  Everything else listed
> above has been exercised on hardware.
> 
> Thanks,
> Qianhui Xu
> 
> [1] v4: https://lore.kernel.org/linux-usb/20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn/
> [2] Sashiko on v4 1/3: <sashiko-outbox-185247@kernel.org>
> [3] Sashiko on v4 2/3: <sashiko-outbox-185254@kernel.org>
> [4] Sashiko on v4 3/3: <sashiko-outbox-185299@kernel.org>
> 
> Qianhui Xu (2):
>    dt-bindings: usb: snps,dwc3: tighten the two-connector shared HS bus
>    usb: dwc3: fix the two-connector shared HS bus role handling
> 
>   .../bindings/usb/snps,dwc3-common.yaml        | 105 +++++++++---------
>   drivers/usb/dwc3/core.c                       |  36 ++++--
>   drivers/usb/dwc3/core.h                       |   4 +-
>   drivers/usb/dwc3/drd.c                        |  65 ++++++++---
>   drivers/usb/roles/class.c                     |   7 +-
>   5 files changed, 140 insertions(+), 77 deletions(-)
> 
> 
> base-commit: fd69bd54e328c407b1853378b25d15803d3453fa

