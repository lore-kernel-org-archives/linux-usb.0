Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA00408607
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 12:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686662; cv=pass; b=YvtpgEKJpuU4e483WkCNgopez5BSUtYrm/GdGm9nRUe082H8WHzWJ24WxmIZJNP72qwepE/Tpi4hx4tommufgmj0T1Cyo7tTNnoeGvU91IAyKjDaewmG/TMSq+gfJZ3Izns2Eg4fXzL0BtRRTrDgvlDSqaspfXhboxO8yoDtzKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686662; c=relaxed/simple;
	bh=g913i+oQvvtqC9h1n3cGJjtuEZz8Iv7MTU2C+iwcFLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6n2GRIyK0kxM9mLR78iKu2SdkR5j7zwwDVQ+ekDwdWHPzOq2/wArMCOKb+9ZYssqJk+BAPWjGXwL2FKeA+b4OPiAVyhh29dGEm3MzqwrUFE0owzKqApgl4E3EJwmxsQ0HiGNgKarnYi86tE2MOomUuj6hTgZiievtvWPjWY224=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ai1bIYuz; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ai1bIYuz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bd302c91so254745e9.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 05:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783686659; cv=none;
        d=google.com; s=arc-20260327;
        b=cL3bDC4z/rh/VoAmVePpF6e5ez2xKagIvEVYqg8JRSrRbA+hqOwETwqj/KD/sNxPn1
         FnI+BieO3rBi5RrKGy4gRIYpU2Ci32VRgEwxooQueCdOFiB97wspYznB6AmOZEU8n0lK
         nwi0SpOCNuEMGgljTXJ3H25P5w9X5ncPA9yKkeog6gyuEamQlqV3Dnyw4tRfo8ezyGjW
         y2rviW8oNDFhLJpH4oOsl4D6AqapZc22PUILXylSGZAm2I7+A8YZo3S2BrPyZmT2+yLc
         0NSZAvFn16P/zl5U5nfWdgohVIvn2zVBwwp0zsFWQOTb5QG/lqoqW+h/XmSD9j+eSaXR
         sBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g913i+oQvvtqC9h1n3cGJjtuEZz8Iv7MTU2C+iwcFLg=;
        fh=MuAJJVQ3ratrip6Zegq5Hko0jUk0MbbA8Xv9Y3k+1Jw=;
        b=BtwOhgOL5TEi6aePZPH7x08w8qsZ0DX5ovRMx44jnQ5JNn5Qvzu8q1EI+OKa9oxOIP
         Z2WvPLgdUKsl47HyQpriKEQ1N2WP5YqclTfMCSL0ewMeAZYXZOTpeZDZJ+bli51Y2utD
         +U2YoJAvGPWfzMgrgCPVlQYOeDvLYKZD/AbpklmD6VRTGVNw5ze/YbBmdWfOt68iRYvZ
         TCg+wCzxWVlt/tnMPg5mGH5bLy2OwzO8J1aVPNWQD0O1BNRjZ5axLi1oLHkPphbuFrZj
         BrrWhlQ6pJN/YAjpHxok9m6ztdjqdo2AYNB7itTlMyeUoP0GoZ9m7csoULqTwuIQyPg+
         yw9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783686659; x=1784291459; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g913i+oQvvtqC9h1n3cGJjtuEZz8Iv7MTU2C+iwcFLg=;
        b=Ai1bIYuzHXJ/0V4sxyJ1AhH9DmHNDGonm6FFoASZhzO/n39Bh6S7rxWa166nTYlwWJ
         DV5QZcwMf8/9SM7FwIK8/Bdq4w8m4M95EgczgK2Uce0Unwfi9+jfQLZdr3RWH8PUqsQ4
         I750mM9n9hWrHODXPE3MDS7bdzA2rFcZRaB2qf16/B3/n8hCYSdjjvQq8juoxkroe1LW
         7cFK40XlpCRgVJQe6kR2K+LwyniTx2lCjJNNgzhJznIByAfTUXxm0xuzvIxjwvJi6R8W
         qyo9u9Bv+Sw084hDwJggoDO3R9gJ07v0VjT8KVnhmg4rvLOMdcRaKR3aLUYqSESiK6YT
         efSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686659; x=1784291459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g913i+oQvvtqC9h1n3cGJjtuEZz8Iv7MTU2C+iwcFLg=;
        b=IuB84qwrP9K1ODO4ULLYddRgr5JDlFtlgo05TNiOSAul0Kfi2XxiftAqrvmI3MJXhK
         vPq87laj+dlKfgShupRyVKD07yb7upFclzGtq6bsZGAFB9ZXhn90QCCoNhr14mNftl5M
         LkgbphhWWETdvpbik0wtim1DkDMOMCnIiofmycJndp2f55Ij+n+DYdE2t88z4aQ7Kd1h
         8nW1sLHJFwnLcFJcFXuPXcpPiSnqXR3sxt6Y1lUqDbupbXQwaK6CFVPHnqd6mdvJI/SO
         6CNo+EQCJjjOSw1r/7tWRJ+HgjCD3affs6p0+CzhjhNYKTY8v9z8u5FTK4iYF9twb0If
         o5+g==
X-Gm-Message-State: AOJu0YxroASal922nhxZ0GoB7Mu+jFZGoE3gbdJ6d1X7Xe9rve4vkx6o
	S/6GC9GMb5HIN33ZvcD20bSU9ViWIa7GcsUFodf+b5rRydgCM5lGijQHbJZ1SA/8fjolsjF56QA
	qi066v2xU+zdpQ359tRvuEkxLREfDe2qoC/k=
X-Gm-Gg: AfdE7clJH6KYxgmjzDA0gDTeFzvXIjx4qVZHD71ZFQVJAu1eFDfbNx/b7eqMXAtrZVj
	FCjZVvnNkBYyIQ4dTKFOCjVNI9KyzdDaA9GTp0v97KpjsQ3Q3N8x+TrheSyFUwq0JQVTF9Xo1q7
	lbB3Vt37aKwvV7/4Bti5Xxlxw1I4srOR9QXqZXh/wgwGwgFje5sYbB89c0XsYoq0ceJ03kTaCBH
	38LPhxaMk0XiB+FoUfl0cLvrBIWhPwE4quTql6ADHLP8I+kpZ01umwVg951rJE+WfEe5dxJ
X-Received: by 2002:a05:600c:3543:b0:490:846d:4edf with SMTP id
 5b1f17b1804b1-493ea511ca8mr48471455e9.1.1783686659184; Fri, 10 Jul 2026
 05:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADvEaBJnc49dyCNTbe8ys4G4HhEKpMFyjm7xE74evxFodYFb-g@mail.gmail.com>
 <2026071024-zit-pretender-1bb8@gregkh>
In-Reply-To: <2026071024-zit-pretender-1bb8@gregkh>
From: Trabajos Iafast <trabajosiafast@gmail.com>
Date: Fri, 10 Jul 2026 07:30:47 -0500
X-Gm-Features: AUfX_myL0h_e2RZ3nLDhlf61_XlwhWq9yrQ6z5rfAUgG4KkZ6HyidBqBrKeaZmg
Message-ID: <CADvEaBKxsMx2nATKsuNB7fovPewfiuY-dqiwXtmohLNpZ_pWgA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_UCSI=3A_no_connector_change_events_for_connector_2?=
	=?UTF-8?Q?_on_Lenovo_Legion_Pro_7_16IAX10H_=28Arrow_Lake=2DHX=29_=E2=80=94_port_fu?=
	=?UTF-8?Q?nctional_in_Windows?=
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Tested with mainline 7.1.3 (Ubuntu mainline PPA build,
7.1.3-070103-generic). The behavior is identical to 6.17: -
port1-partner is enumerated at boot, but number_of_alternate_modes
stays 0 - usb4_port3 still has no "connector" symlink (only
link/power/uevent) - dmesg shows bindings for typec port0 only: typec
port0: bound usb2-port1 (ops connector_ops) typec port0: bound
usb4_port1 (ops connector_ops [thunderbolt]) typec port0: bound
usb3-port1 (ops connector_ops) Nothing for port1. - udevadm monitor
(subsystem typec) shows change events only for port0/port0-partner on
plug/unplug. Plugging/unplugging on the affected port generates no
events at all. One additional observation: with 7.1.3 booted without
any GPU driver (NVIDIA DKMS does not build against it), the monitor
attached to the affected port actually displays the boot framebuffer.
The firmware/BIOS sets up the DP tunnel at boot (Lenovo logo is shown
on that monitor), so the hardware path is fully functional. The
display is lost once a kernel GPU driver takes over, and since the
UCSI/typec side never manages that connector, it is never
re-established. Happy to test any patches.

Best regards, Kerly
