Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32039FCD8
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 02:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785551013; cv=none; b=ARXD4FA+qPNKUoa889/mZ6KaA84Fic2YRNK5b3E9ZNmbjUeNtK139DNJdFfbHKl8p5M5/3KTDA828I2bsCQsprEWsUWdBcdpcH2xP8EF5SCgEP3u2A9HrONxtZmQc0DJGN77Pqlq1yW+GlblUCc6iPrGc5IWq6fOYSbGT9w7tYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785551013; c=relaxed/simple;
	bh=rPf3/79Ct9yT++Fk2GOpTyZMRy9tMo2ywlH0Xw9EJ4E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F+2VwkmjwQegbLsT5IqxwbIYqoH9k1BjUb4BbZRnz+lTs47mouPJjX1r+SxpvdDFzydUsLfT5M9OvCTZzD/ymT3yl4zELaSxFbKoXelErcLBGRCYut0jcMQxWC4W7/dLC0/PPFUhwuR8n34uQIVGqh8iPxGHDEuk37ldJp3atOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=ess4JQCO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="ess4JQCO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1709021f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 19:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785551010; x=1786155810; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rPf3/79Ct9yT++Fk2GOpTyZMRy9tMo2ywlH0Xw9EJ4E=;
        b=ess4JQCOPWuJyHzzNFCKEGx2grXyfef7H6f4Pb0Qt3kGPKfFltVEKMGSz0DBakiqgw
         wuQYcRpATaKBr5eHsfdcuf0Qh2aGYfAqOijHhUHUwAgNJ1+AcI84thJiN7b6W8qiH82F
         mfUcWL1HevNwb9dBZuKIKOKMs2cys3tOWYYjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785551010; x=1786155810;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPf3/79Ct9yT++Fk2GOpTyZMRy9tMo2ywlH0Xw9EJ4E=;
        b=p9soCB558htOZL4i7dMO2JX6wIBlW5IBiakQzZAqW3QvuCk5nry++0h3iobjMKcSQX
         np9ZkCCyKjlvYZXcFcKO76qLwQkD1+ZN5w1BfjvPnYJMXFlXVRa8JmDFs+zpbl/czlIj
         ZyjfoR+tTXSp7jkYsvZ8nTpwPNmJX5g84BrHceAwI02Z5/dQkuhUYueUDmPONEZ8PBl7
         GE9gskScFGE1urwpUJNtvPQWeYE2zBHddpL6bt8kVZ/S1o+vnC0ve0u3aN/L4JgkhBI9
         VMQefGgj479KRNqnrT4q6AZ40jXC50JEcpwP4JskNipP/0FvMDyNvn/V15c2TOhSXVb/
         8iDg==
X-Forwarded-Encrypted: i=1; AHgh+RpC8facEF6gnTjNhD0DTFLXoYsVHOwcOWe7XTaHG+IuJdwauoAGn3Hgq4QrGs2P12QZVo/bvKzC1e0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6s/smqyY5+o5QIH3+zWwGtspTQY7lxS/E4+7pdO9OUuiXiAa9
	RahoBv97pwdI2cjRj2GRIe3UKC83Muhy7DifHaTjuC5jsgwUbD18du314YWIWXMTiI8=
X-Gm-Gg: AR+sD13XoPJ+BCURtwuyBvIwjj8VefoWCjmoVzA47Iy8DRHUOl/ZX4Te7uR5Kdf7aZi
	MLZ3rhtRJ5GCBi0l2ZJ/UrXxO00HsmUtkqmEA6UtxA91R5G+JL990UlcwWdX2BSm6Yz1QU17r+E
	rP6NVftQ05eDwEe0h6uft2PSEauS+WgbBUyRX5My+xRW2FQ1JoahtvbQkEiFfSOj4v689wpbIvr
	a4/uj+FfMfT7lxQ+q6su8bqTW6nsVBp4R/HeAMXcBUzaVKLIeqt5htEponrIVoUmMFbsfJrUMG5
	mRgNj5FmWjLfz44cZ4WOeZtUW5sue9IS5NbsxPZUCptVR1HW/P8IIIcgU0eCalmR9587iYUa91N
	78yPef16NnUhRxZXB7h/A0DL9z47HzN2KsYsjyiCK0z5yjVatDLO8aFAnxbsuo+1kpnTSCAMW1Z
	MpBt+3gTba6rJPtC3b6b8X7/WPsBAIqaunvyUm4PGF/9roV0ETpl56C4G87+Qu+nt6i9JjzKjBb
	ek7SYG69WZw2vVmF6h8LpCO+DYm2i7RVQ==
X-Received: by 2002:a05:6000:480c:b0:47d:f6a5:1fbb with SMTP id ffacd0b85a97d-47fd7270145mr3362412f8f.13.1785551009970;
        Fri, 31 Jul 2026 19:23:29 -0700 (PDT)
Received: from localhost ([86.122.199.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm12176466f8f.19.2026.07.31.19.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 19:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Aug 2026 05:23:26 +0300
Message-Id: <DKD908MWMH7D.2UF27D0IWQ77P@wyliodrin.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] rust: usb: abstractions towards the port of
 usbsevseg.c to Rust
From: "Alrexandru Radovici" <alexandru.radovici@wyliodrin.com>
To: "Alexandru Radovici" <alexandru.radovici@wyliodrin.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260801-rust-usb_control_msg-v1-0-124cf21c82ee@wyliodrin.com>
In-Reply-To: <20260801-rust-usb_control_msg-v1-0-124cf21c82ee@wyliodrin.com>

On Sat Aug 1, 2026 at 2:59 AM EEST, Alexandru Radovici wrote:

Fixed some mistakes, will include them in v2:
- use `Duration` instead of `i32` for control functions timeout
- fix control function 0 value timeout from "for ever" to `USB_MAX_SYNCHRON=
OUS_TIMEOUT`
- add `#[inline]` to short functions
- use `u16::from_le` to read `wMaxPacketSize`
- rename `Generic` generic type to `Dir`
- impl `max_nak_rate` for `HostEndpoint<Bidirectional, Control>`
- make data `&mut [u8]` for `receive_control_message`

Alexandru
