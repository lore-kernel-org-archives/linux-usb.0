Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010627;
	b=aS9c3D7g6gssElsuSYqDdpmD8QvPOfyZ48K4wsztgmB4sXJB4thqf3Vi0cSGrVXIfIEl
	 dAaL4lqRIcEd1epwdkws3RUthP7Sjw11mBmRbMDi0jIb61nAE47uDGNi0RQ+erTCYs2lV
	 wCSSDKyWu15IthKEIvJM2MQqZt+sxQLgRSmQnM787br21yvZnf6kIgL7X2qx2bP35tea1
	 UY0y/G8RUf0fRwY4G/3jMftZ1imQ0ae4+Haz45tQP5pcW7Ax8IegfGNuN7A0YdEugi1uv
	 lESbiH96pMI+szT8AUqwIMzsnW1iugYAQDKmmb7dOlt52O/K399vts4+dwmb83iOJbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fmou8HKl97Rj/f+d4Cpu9RbEo6XHlT0wS1f6nZoJa4o=;
	b=xuk8YElNmQmkqVsAAPu+k5C2vIa2tUPwyXby1dRAuYSo+lsKtUFyo1z4e97JF1MuoVHy
	 xobCuNY4GY3iMduqAlJKKCTcaPXwhz0ZanJl4lbZyScqDYFG6AhFObI+hxtzWz8GiAL24
	 RklOdCw9t7gdeZNPrrtKPDAJ1LhkqQ6w4GfYev66l87Cp0EgFHpkMS5DYdXLP5mfI9zQ0
	 jJSPS0GSLOrMUymUvN3R6EP7oWnr04puYKAPJHyRuNDAuWQDHzjJf4w97MGXIVjokCQ9j
	 BiVu7J3FVTqGWnopVgGnLVy8gcITR+KojA96Yx3xDE2BuEnCMjj631dDg16y4e93cSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nEXWSi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaiGTWyT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9150606A31F
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 10:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9150606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6nEXWSi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BaiGTWyT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q9aass2560679
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 10:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmou8HKl97Rj/f+d4Cpu9RbEo6XHlT0wS1f6nZoJa4o=; b=V6nEXWSi4LB0OK3D
	lpHFE8eLfokzET9KoxGSpxJVMCoM7Ub6Cwt/VwnfZl6Ej7fyyMdGInoEdzKU5AOX
	VwKehBd/pxQ6k63Eh0ETShO9S8B3gy/8KkWvzmqlPkgBhWYhrE/fD8gQkbu3tDPC
	MOWFLtFN1LPq76H4SdqxvWe7Pt/7gDb968M2cVq5s7LVCnrECPu1Usd3NCiRjixP
	3grZDQtWVZDvYNpzje1FVXLATfI+xfdcgBPWnpqP5clXWn6yqSs7n4AFzXkUu5b4
	lfFY1TTsjomEGQi7NIdL7j2r9wfdGAcBQnQNNAEh0BCY8hvfdmU+ZnlEgSefdO2I
	0hGp9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp86qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 10:30:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so362367085a.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010625; x=1793615425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmou8HKl97Rj/f+d4Cpu9RbEo6XHlT0wS1f6nZoJa4o=;
        b=BaiGTWyTmY7tqBWxiwtKpCFpK/jI9X+q7+RtJj/pVF6sgDlwtzjKjpLW6i5pnyobCD
         Za4G4Inyh1ey2qg+PsDXlIVO/gpabL+tWsucv9uhTnppxBhWlCi6EYiKVJFoGxTLnwCN
         S/mO/IucXJnoOQTZWu27oHPvzovzIRxbIpHBH6Trd9ELIm3SvdmMP96tm/ehQtEo3ruQ
         pURFgDmw92vib5ohjUbIbcWm77bR4DHlIRMDdJAr0+D/f4GG//EdYpDWRv+fT5KhB7hZ
         G0PwCoeBNZzgO6zkellicix6hOG8sZGSSZVCWpDmFIOZBs5yfmtE3vQHJw0f5GtjFdtO
         eFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010625; x=1793615425;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmou8HKl97Rj/f+d4Cpu9RbEo6XHlT0wS1f6nZoJa4o=;
        b=gKFBVzXNPnyyVpm6i2JItfMdooeriQ9ofWfBSm5TgGVp+AokaYGfH8O1jXIHYuKDKy
         gZf1MQFYY++CefCnU37zqnN4S1O5BCK8gOjiGkqdGLBo/lfc9YFwqW6wqFtVH7ZKWIIL
         KYAPae7i+GkWTVvSynqpqXXsViauTjY2T5sp1bxRkTS5T41hi6piKlhIWn4X8omEPfes
         4ktBqpc5TcLGoHjr3/m5XZRhQXh8mjFQYq14YRS6eTT6VBy58AaCLolGtL1FWOJKnvjf
         0751Rmk7p4r3qqjnAhWLpyuauE+RITxCPCtsJo1Uju6UF7iYmNhyLl5PqaJsc5UBoxYw
         Jp0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrfsKeBLFiUrzJHF7SRXyfJawLTJ1fYjie2xHV4MXLI7KxI9/Eo3mDeO6qvENUn0gbDCwuhryPcGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTcnwseKel/VvTDvssUTrGdViiPx1eDDUkYTFHZlM3RBy1/b0T
	Nfir3iydccGr6dtZqkjkTr5LjegTuy0OqS8AkdOBXVXEXRugmkk2V1g+HODo/llbIuW4sArs5nY
	AtjOkDXl4Gs2gMYzK5XBUhE6jxP6O+uIEVwXAKAB46W4RARKOV3+PVidtYaFseRc=
X-Gm-Gg: AYBFou2/UVNCSJvM8kYx74+IxXLpN8U2vDPOJmt7eQp4DD+/56F2GvQu6rkht8fxJrj
	d2AOncCDcfRRgDPfmni0DwOQyF6S3PFcsnTpT5QY2FlpVTfxgUaJ5EdkwcHssUgVhY5FW/DwMrR
	zZIqTRW/qU/D/MHhKWBSR0KAJz2miFKudG4BCPV0y58r7FdQe0wqyf8EdRFGEeeebayXVP+ZRmw
	EEHTQrk5ipeYcHckEEAzoEAKps2iGNE6qZI8db89Ecab75CsRnCnQt9AMP9cKNN/YKsox8WgS0Y
	eNofnZX9+4lwU/A9ixlggNh6f0FwyN2DHEK5dYh18pF0UjDwlLOl1IDXhQN5uKtqPRgWfowTNZN
	YRrHSk1J3UoBfUXYP5VM=
X-Received: by 2002:a05:620a:2621:b0:93d:23b3:5088 with SMTP id af79cd13be357-940ef914145mr903067585a.16.1793010624711;
        Mon, 26 Oct 2026 03:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:93d:23b3:5088 with SMTP id af79cd13be357-940ef914145mr903062585a.16.1793010624166;
        Mon, 26 Oct 2026 03:30:24 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66c6f7sm302988766b.63.2026.10.26.03.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:30:23 -0700 (PDT)
Message-ID: <fcbac09a-be91-4fac-ae0f-934f628afa01@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:30:22 +0100
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
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: "thunderbolt ... (DP): not active, tearing down" error breaking
 DP over thunderbolt displays
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
References: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>
 <20261026052331.GC158991@black.igk.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20261026052331.GC158991@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXz/vg+ukSGWy9
 jLTH7IPWD3tSpyhMr9YqrFiRJOHzyIOLOo8oxk8vloGD6T0CmZBft7O6h13jtB+4k/k5VGnlk8l
 Dm3Gvap9X1Ltt1c1uOs7VWkvGPvIhtagv/J1Czi0P+RdsmHFJcl3QZzzw0EcwPqimVeVZryxEY8
 boD+/TAGJPrKYkUToyyCJz2EgH3JjnmTmChgEjISB4+M3hhAxTKs31LvYfo5QXUODiwbRwczOmZ
 /knQwp9dNf5nzxOoFXg/P5HXBYek7hOxP8PXzx5FUYQ2UtaZ5UhBSPxYmcQcXSk/Y8MOt4YJaX3
 A/husNN+oau/VqOV6BusliuMtFgIGhPddX0HkAOB6zAtlLNELXHI+3xMMY8GyHlL/P6thuBX8As
 hGiFFVrpLi5IZywU5HBXk38VUEhRf8tMGBbhoa4tSHUl//GswjMNLXkXMtsnjJJkt51dZuGYz9H
 sC5fZX/+qtRMG26CUHw==
X-Proofpoint-GUID: tBkkxOlgffVamnp0vN3Lq9v4sTxpKC8I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXxxRQdQKeSeGt
 G5eVYOHrruXTZKOh56CkmT8UBr6qLJSLdviWC9K+J1/eLyv/yzL44N4qUHfPAL8E2YxRMrkjwH1
 qBClFEtIJLLyiHxibpTT3QOUBOUJ2jI=
X-Proofpoint-ORIG-GUID: tBkkxOlgffVamnp0vN3Lq9v4sTxpKC8I
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf2bc1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=yxZzxqTSAAAA:8 a=vTr9H3xdAAAA:8 a=2yBydqhHEjUgUfZhwUEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=O1CjF_u66TjtNpJpfgT8:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

Hi Mika,

Thank you for your quick answer.

On 26-Oct-26 6:23 AM, Mika Westerberg wrote:
> Hi,
> 
> On Sat, Oct 24, 2026 at 08:17:16PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> I hit this error:
>>
>> Oct 24 19:16:58 x1 kernel: thunderbolt 0000:00:0d.3: 0:5 <-> 1:11 (DP): not active, tearing down
>>
>> while doing some work on a Raptor Lake ThinkPad laptop plugged into a Thunderbolt dock.
>>
>> After a bunch of debugging I found that the problem is that I had:
>>
>> "UseSimpleDrm=1" in /etc/plymouth/plymouthd.conf, which combined with
>> the latest dracut version causes dracut to omit the i915 drm driver
>> from the initramfs.
> 
> The error means that the graphics driver did not read the monitor
> capabilities in time (~12s) and therefore the tunnel was torn down.
> Capabilities read is required for DP tunnels to work properly.
> 
>> And when thunderbolt.ko loads (or maybe only once userspace pokes it ?)
>> and the i915.ko driver has not claimed the DP connection then the above
>> message is logged and Linux does not see the DP attached display(s).
>>
>> Building i915.ko into the initramfs works around this, but there
>> seems to be an assumption on the kernel side about things happening
>> in a certain order during boot which there should not be.
> 
> Right but as above capabilities read is required by the specs and we cannot
> keep the DP tunnels up forever to consume power (and there is also
> complication with add-in-cards that don't have all DP INs connected).
> 
> You can pass "thunderbolt.dprx_timeout=-1" (or some number or seconds) to
> work it around.

Hmm, I see thank you for explaining this. The problem is that these kind
of timeouts *never* work. We've been at this since the late 199x years
where we had initramfs shell scripts which loaded scsi drivers and then
had a "sleep 5" for the scsi bus to get scanned, which of course was not
enough on some machines. This was never fixed until we made initramfs-
scripts use udev events to actually wait for the specific disk to show up
instead of a sleep X + blind mount /dev/sdx / which failed when the sleep
was not long enough.

In this case specifically there are plans to stop including the GPU drivers
in the initramfs because of the ever growing size of both the drivers and
especially the firmware the GPU drivers need, see e.g.:

https://hansdegoede.dreamwidth.org/28291.html
https://fedoraproject.org/wiki/Changes/PlymouthUseSimpledrm

The plan is to instead only use simpledrm during the initramfs boot-phase.
And the recent dracut changes to modify dracut's plymouth support to stop
it from bringing in GPU drivers when UseSimpleDrm=1 is set in plymouth's
config file show people are sitll working on this.

Combine this e.g. no i915 in the initramfs with a LUKS diskcrypt password
which the user needs to type in in the initramfs boot-phase and one can
easily exceed the 12 seconds.

AFAICT the GPU driver never showing up (rather then showing up later)
would be a (configuration?) bug of the system. Under normal circumstances
this (GPU driver never showing up) should not happen.

OTOH the GPU driver showing up late is expected behavior when a system
is configured to not have the GPU drivers in the initramfs.

So it seems that the current timeout of 12s optimizes for the wrong thing,
it optimizes for a scenario which should never happen while OTOH breaking
a scenario which (IMHO) we actually want to work.

I think using a timeout of -1 should be the default, since by default
we should expect a GPU driver to show up and claim the DP connection.

Would you be willing to accept a patch to change the default timeout
to -1 ?

Regards,

Hans


