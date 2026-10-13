Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018124A64F9
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926148; cv=none; b=tsPnRPyzS626c5Be0rx5/eEZCg2KP7jT2bGNET7JQ/OIuDlpqMfC1oUBc1YdEsoemioGJluFzwO+O9VR+aLVJTOHKOSyaWdfnM38sBdp1+tNYjDa3fCBYIwC9mol0rP5sNyRwZ5QEVqUbAXluPg45QKdCevKHGXKXV2ebnbjfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926148; c=relaxed/simple;
	bh=xFu+DWrWAIP8IRuXhvMH98pEDfL804P+Xa42NDESeY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWvmYc+d2YSKcd9Nli4tZsgejsS0CUKJbjalm26RO29qziih8YRhofYbax+NuZfATcWBf6pa8NpkMv/1wEL5tap90zep+2Ha4ySNcKbtMHlbnTixom6QgLMR2NTaD/0mRp+2UdGjjzlLi8PsuWapnAnShOrv8+vrLkvKGF9ZmAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ujpjsjPi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ujpjsjPi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so181875ad.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791926145; x=1792530945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5F1AD5b8BeP2FbndJLBF3CG/uQ7xv9zWoUU7VhQeeU0=;
        b=ujpjsjPiXpROAm6iHR9ULXZqdUHqjdT/XTh2DSGe1uKC6xmhCEF4/+6xUMDBuZ7SKF
         4uVe/efsgU6LPfr9rrEBKz3F2jA55XBIPlicHYSt1CrVsPK/TpKN2x3JdIw6Bnck7Orf
         ZHBvEe4v7gmF+E2qq8jd8VNI+AvNM6NsP1VDJPMsEzy/H9aNHWqq4J4Sw7NI8QPVeK9/
         aHCaiVAZ+h6c/t2YOhSF+ymv5hB4Z6hDbJKTj/0dVtqbxByXfpEg/kRHoH+cHjNXblX/
         kJCT7Zac4jnVQYqqA/3ngHO/0pqthmwbLoX3UtzoJfLj/ZR6cMBvwxfrvA6ZJsQAYvYo
         +xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926145; x=1792530945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F1AD5b8BeP2FbndJLBF3CG/uQ7xv9zWoUU7VhQeeU0=;
        b=0PPUFF1xtdcDOfxpi2NgL0DhJtr8FZES2xYwcHXVP3x74mzw1aXmIhRfB7JSl5lFU4
         e3L/l5HJJsr9p9aXGoBYEfhSIy7M+/MpBI/7mBKaR8yH+zlpgnbVSNQ2vruc7ju1c90J
         M1w/BUUc3WWw1lIggRWfX5I8KFehvw6jVRiKGiBLvqRVz/tPDbsL+d0feCC3QulsJN5k
         HGi/pKv84jMYUD34Cdwh/rB8dUMAGYSaT8sVDyhOscdrYAGATXybWhn6Dq6wIGZaO2Lz
         mlyzyrIUUNYHEgMLzlwzdhBpDgIT0u2/Qe3uy2Azh41SgZe+r9UZ36GfHTKbM7g4LhEA
         9hvA==
X-Gm-Message-State: AFq9FYKgP2pfKJ0Uaqb/FrMUvjT3rrvmDXHkCOzojNm/WLhvE5yCuQ4q
	zDJL05bAy2lBNkbvaH+mH39O6V+qvGpUSkLqHrSZy9lhOCYClP6oAk+os5sOmDlomw==
X-Gm-Gg: AYBFou1cB22sVDNqXce+WOQbjGKGg0BnB3WfMflZWdMXlYHI1qZxYNQC0k8uofOLiEU
	vyA/SzHinLe5aRRLVQ7+djjX7T3hnel+u6QTsf20Um7k7ZY71QKK1uhjd1+Mn89Pom8eius6sdN
	jxnAcuIvmT1SXFND0jadwWXTVuy5bv2ujaPQCyHcB5NrKgxBYzAB5mk2XjrKPHCyGe8SA0JFr55
	Lt9IU/n8huYaBEBc24r/p1hCD3duoVB/yLWWyDSzWU9gcirTBxKWva3vWmJAsXKCd35XZQWuBPt
	jNQdBjbgRC/XU3FMgMV3cuqy4eJ2LVp/CHombdIHEl2BUmRZIYLBiJfxM8aCoAXS2CA827AsY29
	Il0ivREkVR2E+0t8XsNbKnncTPzuYoPKbfQkPGqgbNgbBKeGCxI4SV2UUevjtW1j2DKaRYwv1cI
	PnvRp+eujqPggQisBJr5HPR/jMWDnhq+mt016CK8RaQBVVa/PsTWpSU+lE8nAiNPo9q85Nxvtb/
	eaf8wQTDANV0YJX22phkQZ5ZHSnxydp1TA9S6KYPw==
X-Received: by 2002:a17:903:370b:b0:2c9:b404:b55 with SMTP id d9443c01a7336-2e87bc78496mr12346225ad.6.1791926144407;
        Tue, 13 Oct 2026 14:15:44 -0700 (PDT)
Received: from [172.18.208.19] (86.70.105.34.bc.googleusercontent.com. [34.105.70.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d8050da10sm308421b3a.53.2026.10.13.14.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 14:15:43 -0700 (PDT)
Message-ID: <ebf20112-a767-4eb6-a6cd-4d2f724bd19f@google.com>
Date: Tue, 13 Oct 2026 14:15:36 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: uvc: reserve frame interval headroom for the
 zero length backlog
To: Daehwan Jung <dh10.jung@samsung.com>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, selvarasu.g@samsung.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jchowdhary@google.com
References: <CGME20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e@epcas2p4.samsung.com>
 <20261012034018.3193146-1-dh10.jung@samsung.com>
Content-Language: en-US
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <20261012034018.3193146-1-dh10.jung@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/11/26 8:40 PM, Daehwan Jung wrote:
> uvc_video_prep_requests() spreads a frame over every service interval of
> the negotiated frame interval:
> 
> 	nreq = DIV_ROUND_UP(video->interval, interval_duration);
> 
> and uvc_buffer_prepare() then splits every buffer into exactly
> reqs_per_frame requests - only the request size varies, never the count.
> So transmitting one frame always occupies nreq service intervals, 100% of
> the frame interval, with nothing left over.
> 
> That budget cannot be met. While no video buffer is available,
> uvcg_video_hw_submit() deliberately keeps a backlog of zero length
> requests queued to the endpoint:
> 
> 	if (list_empty(&video->req_free) ||
> 	    (atomic_read(&video->queued) > UVCG_REQ_MAX_ZERO_COUNT)) {
> 
> Up to UVCG_REQ_MAX_ZERO_COUNT + 1 of them are in flight whenever the
> encoder is late, each occupying a service interval that carries no
> payload, and the ring is FIFO so they all drain before the next frame's
> payload moves. The frame period is therefore reqs_per_frame plus that
> backlog, always longer than the frame interval the host asked for. The
> UVCG_REQ_MAX_ZERO_COUNT compensation already in this function only sizes
> the request pool; it buys the backlog no time.
> 
> At 60fps over SuperSpeed with bInterval 1 the backlog is 33 of the 133
> intervals a frame interval has - 4.125ms, a quarter of the budget. The
> waste is a fixed count, so it hurts in inverse proportion to the frame
> interval: 24.8% at 60fps down to 6.2% at 15fps.
> 
> Reserve it. Measured on a SuperSpeed gadget (isoc IN, wMaxPacketSize
> 1024, bMaxBurst 2, bInterval 1) running the Android DeviceAsWebcam
> service, as reported by the CTS Verifier "Camera - Webcam" test, next to
> the rate the microframe accounting predicts:
> 
>    target   predicted  measured  |  predicted  measured
>              (before)  (before)  |   (after)    (after)
>      60        47.9       46     |    59.7        56
>      30        26.7       26     |    30.0        28
>      24        21.8       22     |    24.5        22
>      15        14.1       13     |    16.0        13

We recently fixed this exact issue in Android's DeviceAsWebcam client. 
In our case, DeviceAsWebcam was only queuing a frame when the previous 
one was returned.

With the changes to uvc_video_prep_requests(), a frame stays queued for 
one frame interval, and subsequent ioctl/scheduling delays meant that 
the gadget driver had to insert empty requests between two frames 
bringing down the effective FPS.

Our fix was to maintain two queued buffers to UVC Gadget Driver ensuring 
that the UVC gadget driver has a frame ready to send immediately after 
one is complete. This prevents insertion of zero length requests between 
two consecutive frames (fixing the FPS degradation you see) and gives 
DeviceAsWebcam a little bit of breathing room for ioctl and scheduling 
delays.

It is not clear if you are working with Android or not. If not, it is 
well worth checking if you have the same issue as us instead of adding 
an arbitrary headroom here. The numbers you report are extremely similar 
to what we were seeing.

If this was motivated from Android's DeviceAsWebcam, take a look at
https://android-review.googlesource.com/c/platform/packages/services/DeviceAsWebcam/+/4353888
and the comments in that change.

The change itself has been abandoned but it has context on the 
underlying issue, fix, and where to find the fix until it makes its way 
to AOSP.

Best Regards,
Avi
