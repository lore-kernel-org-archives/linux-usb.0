Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367978;
	b=LeJveQNibj7LCoGAW+8f+viAzLoUbU5FjiKDn3uGfOzk90elwBbBoL1rgX7FIS+xFVB6
	 y2lA/IkI8ncKOKmk/DIOlXoT5/Pjt9/zmgBlI2dVFob6wgjn/YXojVIGZLk4E7vsLQv8c
	 pR2rGRGyLVevY1YsafC6hzd7VLRkScIUtJD8zrW5LD765wGzxrHm5xjf9llHIKMXgRjSO
	 lCaCjrut9ukEGFfu+QHBhvqJTvs2GJc6NLLoZJnAdrD9Gpy//1LfvLIGum5aNY+ue1tEV
	 4YMllf4h9/A4C1GMH0D5C4nRTOgwZvNJgXlsG1lxqMiyEQ592VLbNqfsOvt3yLkJsvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
	b=HUst8QwP7fjH8CV+vrL118+OM8mE4ABHORh+iA/++EloPBfwPcF9v49R/O+wTnl7f4Jp
	 CBA+v/y/LhcT1ZTtJQGwHBT4kbCAfkc1CAKEzizpnGvt/3GQORFX+V7tvXnvqWuOfaj8F
	 d4V9zTZU8zUtj584qqACUYqFqaLJtCU6ONU0gaOTeTezu3sp2piKyIZHeZUEggBZ37me7
	 f94maIDO5+2tRwdH4WFzgDS/uHM8ycdsnHK54Ia7nIzMlx3antIxI+eN3WdhdsYApdoEa
	 vFve/AUdVvWIMS5ltkeuQHqVlLcq5oTF5QYwfHoT8y2LNZFhZD2n4YLN5FwIDnIu0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MHCzlPUZ;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E2606A31D
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816E2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MHCzlPUZ
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-53a448f86e0so462742b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793367971; x=1793972771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=MHCzlPUZKMnE2kNo9yoyOWyk5iazVdyGZcGd3KBZgWLavn2s/MGurSTnlnGWrQcNlG
         Y4sRWrGUcDXFVzUpwSMONQl4Vvs8Jlm/MTkPIxqmO3Gw4v3nqb5eZnERYCNZ8TeSG9yQ
         lnRadBi21wkXJaAEkA/aq62Uy9tv+sDun8I24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367971; x=1793972771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=ppqXlrZabb5BmU/CL8Aq4Ycb43KhXAGCHmuZlUP/G8q05TodLI5NSFi6Hvxb9aBAw1
         oWzMU25KJcgHYV5kKTPDvTkzuEQBb7umvIdbE/TO2z25bWJGOgRQX5n0u0ayzi4uBzRl
         JJGnqHmTiKsuPw/zVcFEob3Yw1bQXalRoBW+KHuqOIA03qzPq+ysEkj29MwcPkzGPKFM
         MwpVjCBqfUqZrIbtvpiymQA+J4ayokZMm45CHAbAnU7PJPUEyNbCzW5yrTFp1Lauq0AY
         OUmxLcKFMT3DN6YtckiS4CB08Jt0aDMgOdyMzZKaIMju/axCzlOgPv+fhtYg3vWTdmoV
         FNdA==
X-Forwarded-Encrypted: i=1; AKwUvBy4RX7t5Yf6CobZNFOTmFB7jw1V5RJZzLS2CYl0Rt2GjbCyAYZV2CFSHPWaWzI/mH/o2dB3fnF7YWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzPvaY/cbbkRj9sFF3BPd5ItUSwF51X39KwdoZIhxN0QnYh5zk
	PqpMEeZFavNL3FS6JltW0dzgstHP8lRKcfXKMw2VkmJFwmwfNEuOoJRSnUgCWhryDw==
X-Gm-Gg: AYBFou33U54NRJPyAa3ZBQ9KosyXd8/V3RCuiN0Z9X7GqaMEmf1rkUwFZpchcWdpSzD
	ar6ICn5dPR9RiVvEaCVjcoNNwS3Ug+x0B68JRMPmEyBClQQi1dTTNIegwq3w5yuKn5b/PO1074+
	/Y6x6Fh4/uRovBmb2pz/D7SXpwnz/hYF76qYJMuC3zKk38rxW4npHtBu153R+xzQPc5gqciWJpM
	c9l2WAL5GISSeMEJWd+09MJNOXlTiNZPA7NJy+E+H9jh5Sfc3RfyDma4q3uZO4E+lnfeOgnwYiw
	c5twIk6zukkRewx4rZ6OstWKCFXisbcKsmeVeYUWgB1rW4J01l1njkqDLpKgbqoYVktosBijPW0
	XKl5xz0S/KsOGRjVh+M/wB353P4NONg2evsFo3zmPs0305yMCuqvg6iddUl00Cuogrvcuu17aCN
	OHUQAEnNnrz1IOcNq94Z9oEcMAr7wUuCoSg64Fhq0qHeQSn++vp0UcBergrHMSdpriIlxcHdvuT
	YCokwxUiIStcUsJ49qRH/VlN6B65aizNXj5md8iQpO+bwf54OPW2Q03PDP41IJKbnfzycuCwvDm
	XTIWwL/JrQvXKrAM4ceuXDX/
X-Received: by 2002:a05:6808:151f:b0:4c3:6d56:77c2 with SMTP id 5614622812f47-5640de7e3a9mr1613306b6e.41.1793367971178;
        Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-5640fdcef5asm1492922b6e.9.2026.10.30.06.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:10 -0700 (PDT)
Message-ID: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
Date: Fri, 30 Oct 2026 08:46:07 -0500
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
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:57 AM, Sakari Ailus wrote:
> Hi Frank,
> 
> Thanks for the patch.
> 
> On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> When CONFIG_PM is not enabled, all devices runtime PM state should be
>> treated as active.
>>
>> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
>> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
>> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
>> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> otherwise the same, except that it requires also the use count to be
> non-zero.
I think "yes."

I think the logic for !CONFIG_PM should basically pretend runtime
PM is enabled for all devices, and they're all ACTIVE and effectively
in use.

That implies:
- disable_depth == 0, so usage accounting would (if enabled) be done
- runtime_status == RPM_ACTIVE (power is on, no delay)
- usage_count > 0
- runtime_error == 0
- Maybe ignore_children is false?

This might not be complete (and could be wrong!).

Some of the other dev_pm_info flags could probably be assumed false,
because they represent states in transition between ACTIVE and other
states.

					-Alex
