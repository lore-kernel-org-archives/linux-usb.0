Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B696223DFF
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 05:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955967; cv=pass; b=C+eJ5nLdC/jk4hiDvmDQzqJTVHpDeGZ1cez8ntY74VTzmwCPYpJoX4w6j60FVTaAnzZgz84Wmr1xz4L0PhpJXSLw7nQE4YtuJdX8lqqynd0Ec7Dcb0/vshV+bV5NGJc7K+igjiTt8Qgcb3Z/josFhwmSzWpDWPMTE/F0XaUA0Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955967; c=relaxed/simple;
	bh=g6bf2XlNqU6Vxa3ceTCehQ0mNii7UNfwID+/aGR8jzA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gfHSYIHV0ebTJZfYeu3a9zNHKJ/tUk0C4pFcnkZIfAQdB9kFwgFIlnxz0wyK8JE/kCor6euZ0A117orAFO/Y7cpt+FeLpmjF2/LiFysWUbyzKF6VXYa3Ai35jJDXT4bXQLxSMGCPWfXRbIjtFlTzGscpLf4fdDxTiq7hFmntl1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+DDmjzP; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+DDmjzP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69fc856b00eso516a12.2
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 22:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784955964; cv=none;
        d=google.com; s=arc-20260327;
        b=VENUYLoCQO1c95E6EWnEJEYL5w29+zKvvlB5/r+2bMo4INRc+QfVR6g4mza6zpMDq1
         AseXU9DZ0VkTs+L+6MpsIwtNQ2nOQKf/KZcvqJNuCLCLQObJuYS41IgGdu3cgJQp4qOP
         EoT/qqK29mFGoUg5kg62wpK4BEj4ENOj9pLHtbDg/zkp9CMwf2ucoYDYGJtFyOELfLkE
         hDlZ0fO5e0Y8bPCOysFMvnSBtL5wDtZgcxxedfeVC79wTAC9ZJv57JGTz405NfoBWZMw
         YONL+2SAeVM44bOIM5JtT0pj2prqKfhD1PuDVOSqLapNUd7XpQG71k5QOUQP2BVEu2wd
         NLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=g6bf2XlNqU6Vxa3ceTCehQ0mNii7UNfwID+/aGR8jzA=;
        fh=xdB5GVJqo6TfNelhRAhMBKrhplvfSWSJAI0iLzMiQGk=;
        b=VznvgOvDy92EgbzilMYwqtyjzFuQKf4hJ9wwG1CK7j346rOFRQdL/+krt2gYDuJVEP
         EG+nx98hmmb4Zx1Q7CF5Rp6e8RGXb3ohxzI0yGkvsEtnVU5Z77/x3+09nyomOvQcrYDF
         GPFU+2SXRK9VYqD7zdypmxkRTyXn1jyEgoEQEBzSrYbujLZXHxV57dpgmEmIKOI9dCwZ
         xMO0jLN2hwN4RD2mvacpX/YIKsn8PseCpVIOU3HySJFgJ2oDnm+P5StpU5xxB3o6Ni8R
         2t4+S5jC3QSmofOx8WK0TMHFUccb/+0ckz2qnNhKHDIgRyEA4ST0vXm3F0Lp8KTTFnS4
         ZU3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784955964; x=1785560764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6bf2XlNqU6Vxa3ceTCehQ0mNii7UNfwID+/aGR8jzA=;
        b=P+DDmjzP4cPBKd6aGM/vupO7/kz6GznJZg57jUnvu2uCXWznpOyqgJ1RuO1MYUn3CR
         bM/FlrvjUSmynN+M5WoL4Iv1D+OJ7nQseKvD7ZK9btiL3miB24g4yClamo9SBf65Igsp
         UxRNfXbGtRWi2H7d5/CZqrteuolxvRvOd3aJTtJVGwMGGGQnUzSZDlxmxkvjxgAYQMn9
         IBVlh8C9eN+DFXig8PPiVvEmpN0x39NEBGuvAvSK7JooszyxwXwTDQ2TCdYtHNlB0EKP
         D5GluS5G/kFbign/0Yp+tLmV9MqJnRwEDwujmy+hS2l3GJnNR6c5yf/2/UZNBTDWJvfb
         THIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784955964; x=1785560764;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g6bf2XlNqU6Vxa3ceTCehQ0mNii7UNfwID+/aGR8jzA=;
        b=qYgoaQvTjbOq+xSMjqUgqt6NdxJN7Fmh2XN6hkMRR8kyPPlguFZLqGIh1Ikyf26Um4
         ZGY0D3Aq3X8f+tCH0EDlVC1XRNeMguTLXG4TimNsolgXDfqPcCdccGoJqrroslNyXXDx
         qcLP1bTQ4YBv/KuyYsajcbiGcPq9+NwLddj2LUs69S+syt7aYwWNwlvhXodct5hd4QPm
         KBu4N3Lhlzvq2HCBi66g2QcsX8hYLJzDOdmHyOnz4HoYobtOOojoanXIEstq1dIcSYG9
         pIWzcCpkQGLsXNH2SHZGrAc6h5XVMWOFBMuTjas7ttoee49fmMmqGvWySCN5tqvzINRs
         7WWA==
X-Gm-Message-State: AOJu0YzC4py3HQKYGQjcOwjyoMjKvKlJwpFbzqKHLHwzyVKYRo3A8jCA
	16T48cFQdTMNDVeu7f8Mhc3mXjRc2VzTm3WE9k19KIOyC5xDVRzgY6KzW2sc0imBxgakQvyXfKE
	uX1feOV1EeYcjlO/P7d40LeZ5Y46NBi8qLPO1ayk=
X-Gm-Gg: AR+sD123KuLAlB2PGpLdO4tpjVS6TP1SRso3LXbefmHtXPlX9iKgWuFTUxlsZF3qxrl
	mIG7shocFx1WRKXoed/sSg1y9V7Lb44mq6KK8ThRdnT/c83yueSsjPVBOSaqWWk8kH0a5Eg6As1
	mhZM15KKxB3WS9hKbcFWkvqRMJqyczUiVk5U5rG3bmtaEeN3P9SJVqBYex86LmSpASJmFgGnoMm
	DdoCN/q+v7319UfHgZVN9gayoBlYSXK0ml6LQo4tCkPsok/tGJehGJksBwk8Jq02bwfQYDKFA==
X-Received: by 2002:a17:907:3f8f:b0:c15:df42:952c with SMTP id
 a640c23a62f3a-c1f1ed86541mr42143866b.28.1784955964031; Fri, 24 Jul 2026
 22:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Date: Sat, 25 Jul 2026 10:35:47 +0530
X-Gm-Features: AUfX_mzJQhcIn1ZUlP0QpmXPLCUZTLkAQ5qIEKJaJbwKFPpg4ciTLHD6OAFilnI
Message-ID: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: quirks: Add 255-bytes initial config read quirk
To: nikhilsolanke5@gmail.com
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nikhil,

Thank you for this patch. I can confirm this exact 255-byte config
read issue also affects the ShanWan Wireless Gamepad (dongle ID
2563:0575). Standard enumeration causes a -71 EPROTO crash and drops
it into a generic Android mode.

Your logic prevents the firmware crash.

Tested-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>

Could you please fold the following device ID into your quirks list for v2?

/* ShanWan Wireless Gamepad */
{ USB_DEVICE(0x2563, 0x0575), .driver_info =
USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },

Thanks,
Ishaan Dandekar
