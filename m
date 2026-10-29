Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300351;
	b=qXY0/YsoVoa5NSmtUIAySyY7fw9c/fv8uNJQmelb2yebx0IWvK33Yl0rdV2KZdEnCduR
	 DL+mv6WgAusR1al4PxPhaZBPAULJ8eSUl+eGk4f4B/1Y/A8Zf7OmvUX8AsuYJUgvTvo1x
	 47gEWLPjrllggF5drAcDd9Utrbu4ZQW3+SFsgXDG7F2cqLD/eXjFesephT7yzQy5etN+h
	 O0JTT5XW9/EPtjGIMnbI11wRC2X4vxL7H3G+zxDC4j9psOFKEcnh3B/XcpPfQKh5HuVGp
	 tn2MuY0LscZrML/ber0jyfJbyb5AZWIJATmR+Sd6TqB5y/sqvNzlqv3D9qtSvKK917Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
	b=44n6mBD+SONtK96Eqzi03yGsPEL6EjumRKE9TXX4z6ES6kSfsKACZyn8RiA6hfz8cWxn
	 BVWvqp7zBIZqCg8Hk5WvwBF9tQjAdkL/2PuvePC+k/+lLdcs2v90XHIdIRjXDg9JTSSRx
	 Tet8rWDkuEoVsDJOqLe9S8I1fLx02VQJu/mG0mM9pjV7aNlDHI1NXLqSOdkZdW+P2THMn
	 GoRiw+kzFh+GOlYibi5UffgVw+S1GUeRR40qLliIA18D7RH/YNhm4bSvfd9FN1u9pw+AT
	 WOoDfM4zgvw5pKEq/mX/9Y8Yk0kjDEJZ76X8WmnRbkPytkvFKFSte5Znm9G6yS8tDzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06A606A32C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA06A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so21099985e9.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=wKHfFSVmSHenG0U1iwKgtGSi1UOPPzW6SwGJPjDKQxqwGUCxJEvCn1DjSm7x+7dlBI
         tUKS5X1HwuZkVolpmPhJFNwbLcWP4O2Ey+tlKOMSKe5uAIMYifWViWBMbQNK0ytgnkU5
         TxpYpjDnhF0RjngKcgEl1OEsxC/rdKP63x/HzurTG3ZCmbKYurx/pMsgnAebRGdPVULt
         X6kw74+yrE1gmuUM1siaydpKy5zusToKzYM/zlLOoKSiOrcEwuwMelyy8U+A1MF4630N
         +VRIg7uYp5Eams5/R4YrzMxIRDiBSFhS3P/ldIwkkN9aFhmNkbr/qpcLWvL6VVYZuboa
         npsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300349; x=1793905149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=cH4FDz/rWw+n5jTvK8exTV2YcMZudsHLG7350DJIsq2APap1s8IkvHIFkQ4dIQ6uwZ
         sbh+Q5CN7QeT3fRJdT+lvsUrqQv+3//K5aH15RtJKt8Re0qXdQnMl1eJS8Puuw/ZYleU
         R7XarLT6W5P6cWPVV3+dvKk2mZIBwnVRDex3OLZgQ1J0zlMjjyE76HF9c44F7RL4Tqqi
         GqjJJr5HYjy81ceSe0ZCbwCcdZx5CpfoR4H7BcoPSY9f1sYSs3472Ud1auPlYIjew/LQ
         aJ/pNoGdyw+u4X12PjglAruPMT0xgm/UNOJzBdpYa12i2q5RhkSarwFGWbeSkflNNSEI
         zYtw==
X-Forwarded-Encrypted: i=1; AKwUvBxO+uowwbTIojsKQZeadkuZGR6Pvm+tfqRcTSVx3EKsPQ4svAKLtHL25C00tq0/iqhzmlVn8nbGcMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmb6sXQ8bfdwzIEdo6bI2h9DQjbUSC/B+KuMsm3Gs7lOO2Hu/r
	kwN8gs5ybhCcLQrCKI1eoknz+2FHpSrnKWJ3C1UPhLtqMB/HHhqvlKUu
X-Gm-Gg: AYBFou0HWv5b3SkZUj3IQhee1LI01cwJ2sTwtSAjcs2QhWoJemFLJw/OLdtLGGg4S8u
	GN9P/Z7Ti2IgRVMY05YPI2MgdIBWS8MHFm/2x+rfnv6V98YwOEUc4+us8QhY8RmC2InKrqmyVV7
	4yzmWUl9STSFdNrOTZr9AeabH+3QBucnn/emxngf9CfoQoaNsAk5T2+GmNeNW+bljT6C30fRyYt
	LRuAr0O51wcq2dA8L6/cLi7cHfqbnSqVSVcBlIuiT8YN4fwjhtoYY5nv7p4/x7rZxmHLglBt3w7
	ihYZuh8RoKGw4OgWolIxPunSzUtza+m0neY2wuiuGmGywNMaYhqzWmVVT4TuSkJP83wJjF77d+c
	BDSIX6DC5R45QdeEf1aH1qdkrnWNhgO6vec6+9SEERDsUVgkT1gSKcieh53GnwA4XEFNJk56Emn
	i1skTxsM/649C8kePLgWUQIDavWcYGKfsZ2vbXLAH8tNBUsr/Yfxugtpatu4xdzXksu4pP7h6EJ
	4dQvQ8W0OjvXjz8FiNysgKHRV2VYlpJEfwE3ZF0h5LeJDhifY7v1Y4LLoJwAJ1aLlQ0mKTTiTMt
	yQCa+sOnSwgluUEfU+w97+XeKF2l/NyxJD8NfEfTkmaaIEjHri0P17ln55qQMGReY559ClRk5Nh
	5NZGDesw+sT8X3A2de9ri0I3qMZXxz7T4FgT3CjsMYTnEH0aL/6UzgfDTMTu0ghPZ00PyC0Az9Q
	2QnqO1FcXpbb1A
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381;
        Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter


