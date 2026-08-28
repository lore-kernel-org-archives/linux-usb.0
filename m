Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE13E3166
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911295; cv=none; b=hgJ+DeT4VhghC/nP2l9WhHtuj7T5p0X9kxQSuhJYZ5bADiSSC4AN/0fNJTyyCIKcSdTXPVsmTns9xSEeafN1FH/QG5IhL56A6mVADwvaRG1jPhRkBh0CthSR3E75aNDWKN48LpIn/OYd2QBwQpLW/RR/hs5TkcX7x13X1D+nWAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911295; c=relaxed/simple;
	bh=V2NCxpXmvAGC3tPTzqlZs/jDxrN1fRwdEMJ/zkJq6SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvlYcPkjNbf3hS4+Clq5f4q2aO6OTBsURHXcdko+mYOze+tjtbGP+7saAaox80RtY+7TmQb2I3INwOylh5+beIxgGh97MYNzYiwI+Xtlsgjga0XYDpUHiNaDc70q3en2oSnU5TSCwHpCFbblQxjoRWHq69o76wd6/gkMqvdJCLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VGZxBA/f; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VGZxBA/f"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso7256425e9.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787911292; x=1788516092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyUgVdBXQPU4wNTO4VmSvvIoSyggZNmCxjmel6sHfN4=;
        b=VGZxBA/fVy4fwgUZL8CqMS+7zqHVsYiF1X97yKuNyEZZBmZWGVOImf9gmEgNI6YB0k
         gD4IKZL2ulkZRfi+lqLqKD4XVDHwPOuib41p2A9aB1GWGv5+EfMy1hOWn2+UBJqkIXBE
         z6BjtYVh6HdAnF1MiRa44ahI1W5C/FM0lTY6eNxE7q4Xk+pOBlZAIqJvPQIs6UtRWfKS
         WpHctSmAlTCnow9rbve1xUdKf3a1rmrIp/2DYhGFkNIDaxvjXkJoGG4asPWZsgDevtyn
         y0b4+Fp0axbM2Hpi+8RBjOIK0ZqeP2mCcXR7Zy7X9M3v94w4vjr2UXRbFkVymRa/x/gZ
         ai8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911292; x=1788516092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fyUgVdBXQPU4wNTO4VmSvvIoSyggZNmCxjmel6sHfN4=;
        b=DqT7LoQIazY3m/gM551HQFrFqAFNv7Erbe+kZkLGr0uWy1uwDSB4Z0RDrIOE5J28zy
         lONP/Ei32mN7ZLssSJJgTjgC9AdntYUuVD7U9Xbh6xNi7bEsgjMFtrkGPA+39KIIg/65
         w91sENEs/gj8CjhY62M/GWvSAE1/oe7bzjPmzgpEFE6yJu2xfEW0T0Q5iOaBei3d2521
         rU/Uqjc3zBLJsGE1H5V6mF9bzqdM/Wr82DMdSOVL7/nwiRDynaEXTCPZ0rEixdNPrAoc
         Gj5vDFOU637CFGf5diIR5aD4/i1FHsN2k9WJdhpoH1Syz3OKsdq3n2G3iYUyMUcC+bM2
         ZpXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpw8sqJjgzMkGiq/eP1cVmMJZfZiRfyrEE+HlAVhaYbS0KE3eiXu1H6Ugb0dfdfoTAOkc+1JbhKHtM=@vger.kernel.org
X-Gm-Message-State: AFuF++lwUh012nJt5Gw+FQ9lI650QsXQks6C+NGtFvzP+VUPL66lB0Wx
	zOd+P3qeeh+U96h6Ag/+zWo09wcIj7BTeini57mAeV0KRGbCbNA51otBX+WyIF8jLE4=
X-Gm-Gg: AR+sD13EYvwL8GI2cQVJYI8N+QIUSA6Dh7VMUXNg/Y70IrVgCmulR55rnKyPHYP3h43
	u4vvOk4Athcdur3FrfJ+xD79ZXBpguxVqBUuhcO5WBkYUhm/i4BL7Ja4cQ3pYUrNLu1+StBkWYy
	Ty2jyuQJuPjrNdhT0sGpWBJw9sXim1FtwSJqU+Y85qBwli25T4iArguxm+g7ULDuvuWMkgCZ4WL
	mUPQYRgvufxDfHQDmxgNcV9+Tfvz3i6t4838CUo1qhuPyu+XN0N1K92szL3BjbdV2R3JugqsoQP
	r5FT8Csm8VcYBcGiJxl3Zmiic1VvOn2rpVfCgmJGrRk+pxgSMmNh0I0Z9y716eH1fjl+CVXMbuN
	M2ng3d0oiautdKHaqauKqf2m9qkDC+mqAAi9xBv0EQGdQlp0QDr1QtE1JzEWpbF95qQYmnjFRaX
	k7uyxr9fUaSlfYBF43uaxX0+DYZhbU2s7NBUl/yZbL5y3YZe/TFanId7wRJ9FGkekwCrfbCQwk
X-Received: by 2002:a05:600c:1f8f:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49b91c44ec6mr72112475e9.11.1787911291967;
        Fri, 28 Aug 2026 03:01:31 -0700 (PDT)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc103dsm36744475e9.1.2026.08.28.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:01:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: jthies@google.com
Cc: abhishekpandit@chromium.org,
	akuchynski@chromium.org,
	bleung@chromium.org,
	dmitry.baryshkov@oss.qualcomm.com,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: allow retries of ucsi_resume_work
Date: Fri, 28 Aug 2026 12:01:20 +0200
Message-ID: <20260828100120.139648-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818205717.1492247-1-jthies@google.com>
References: <20260818205717.1492247-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

>+		if (++ucsi->resume_retries < 5) {
>+			queue_delayed_work(system_long_wq, &ucsi->resume_work,
>+					   msecs_to_jiffies(500));
>+			return;
>+		}

Just one thing about this (same applies to the other queue_delayed_work() calls).

queue_delayed_work() calls:

queue_delayed_work_on(WORK_CPU_UNBOUND,...)
    __queue_delayed_work(cpu, wq, dwork, delay)
        __queue_delayed_work(cpu,...)

That perform this check:

	if (likely(cpu == WORK_CPU_UNBOUND))
		add_timer_global(timer);
	else
		...

It means the timer used is global / unbound: when it fires it will enqueue
the work on the CPU where the timer is executed. The workqueue you're
using is per-CPU.

I guess locality is not needed for correctness here, because of that, so
you can replace that workqueue with system_dfl_long_wq. This is the
unbound version.

system_long_wq is scheduled for removal.

Thanks,

--

Marco Crivellari

SUSE Labs
