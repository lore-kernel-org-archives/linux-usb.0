Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040200;
	b=ZYUgsuK35vGjrfu6dca6HXx1mR01zlrZYkATblD1EgOSaGpGFcEIIOZ0Gk1PN9WeJDLa
	 HjazLooqn3EibRnWbOdaljXJ5t3zlYvOjrbif8EOdJb0X4Hud28nlBev3zh6nDkk4S4o9
	 PB8OuoP2ZukH0uU+EChbb5Fu/i6xZ8xtg+Nw9bJVvGBjZrIZMDnaXBDI/tVvNtFiBDDAF
	 XeuDyalfBgRHdm+uTv/WYa78NBxnnQBAGIxaB3renJmsn2DWiuTHrBDj5Rob9q4cQ5LDA
	 66r0IKBe7fqmxK5gK7VXogctyYZVTVoz3igUhJ8dMtO1WItKi8sL8Tfy6K0240UyMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
	b=FkoS1Ze5Y2end+SAAD3V3DP81BjNZTTCKL2GGBWxkz1GsCFFmAY6n9cRY8vy9tPSi+/Z
	 opVYmrnay7BCrIgW/s5he55bF9Y/oWSwLninFwU6d4rK8KOWZL1X5tYo6YplZ5q9oRoyi
	 kwl+7OqnbWHQJy8crGZ9WXj4JUj7RmGlIY/d1HRcqTbyN04avx6jcaOU7dJUNuvT/rmQu
	 VnVT2SpJUg0JSk4Ep7h/iCLOvKz3tZKrPNtL3f4N86XbYchHcDsDxf59baX+ORENv2pbG
	 o+Q1ODcixb/TiUOdpk4ZaOXH9YwONDDJu9iWKrbHFY2iy2cWYL8bvpXfwXGSONEAGhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B35A606A320
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 18:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B35A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e64d52949so268675985a.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793040194; x=1793644994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=azZPsctqXRKqpOwzOSUanbXvvxd+v2oxaACaz4naHK4U/NBQWTZSH1+8VRwPrLVwY0
         DocnyrGmPyv8LQRxTMk4K4sAlQVJBR98rqP+2aWoEAiU0n2xJtP2lXe11PdsBX9zw7zH
         rykKuo4jE8Sw3g1ZHf1cUaz2vGbXwYAs98RHcsf375OaxpJvYYqyPF71AEMIeOtk1CIf
         vDE/ajmi0uLVqaMusVBTVkVR8NUGi0AybkTdqBwAenvqpPLeBFRcUdif9SgXW44+UVBP
         XcslWkg4kCuQnmXySZ0RwdZ8wSe243a/pyuPpY5dxc6Pr/hlCqlSwaLgYcUdwFY6ZPLq
         p4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040194; x=1793644994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWci1OY37Q98PjNDa+DsqfD5q79/im0Ez6T5Vupv1s4=;
        b=Ca2/G53j0P0svyh4RND4Ebe7Q++hLCLkTYLZYe07TmsCy75fUVyF76TS4fbC2JjGdb
         9TpocvMTkqg7Bhk2LqiHYu9boIrryLKvky3jbJmVd8eduuKxHl4DGUBPY7PVFdr1fX7k
         9Q50MFMlMX5XKiIg8otUEF3zFzBRqMiuminDmX8W/7TCwwsu8eceDt/8Npa5YZztrm+m
         yVCStXDoN5f0eAYORaBRXCHIT87lNHvTsZnrg/148mPIPIO9GmTQRkHNpyLFnDA6r9gE
         Bv1uw+7V6OiTTKTcgfbIE1WTr9Cf8Q6elcLrAmJo1zICqSzv2rSr+b5O0xgGal6Q/y0J
         J8hg==
X-Forwarded-Encrypted: i=1; AKwUvBxxMPwpMfxxYThvVvUeNQYMFao+HeLJnbFN0i37KlQR3xBnPYlT0itzeBvotU5j6NZ1exZOiPAguTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8kiDTwmHStUJEETfHPgeeQYHtyOWfbYDA6IcBCFsc7T3MeyMm
	e/HRNkKmMrmg4NSo7PNUQp5v719XI+A/xCHvGqQ9IqzRGqKjIZ7uM6UsbaLfvhU4un8=
X-Gm-Gg: AYBFou2cCFqgQK+3HubP/zrHcT2LlJGETbIE9Gosi71FbQ+vjk8exmxX1fQJq1EbEeK
	la8+BGOB89Qm7GL8k0nVnLVweQm4yjriQKwnLGZz/GYLlBMzoV+QVmVIaDz8tGmwmRjBjVe8mGH
	mAegNsgG+Iljg9LeH1lIQp2beOp7yYoR8pppvEhx1jVhCRW0NVvTbbIEs099XNtBN9J66bYpplV
	oko5ksE1LWM0iOyN/S6+qaTLp/HWeajVOU1Ei5wyixCyXLAgMY8gNW5i9rJ6YzrYx7zhFBALAgt
	z5FenU/j1w1+iTqe9Wbb6MRJgcOOj65qTUIEI0M1ruG7MhQAT2fsS0O/zOIYSAM2M67838NnGA8
	Kum2kO4OBLCA+94jzwqRpKr+Hm6J6sMOlgaJdHb78mhMoqnxrfOyPgpgxaHt2dsNGGd6OC48iDG
	p+h7j/c2VmlkNudoFXgNo+YUtB4+X09XAE/mFmkjKdePpWThjKHCHFA7tRB4cDOYCelki3/MCA3
	XgI3D2SyQdc/NU/rnEurSIwBjqh0jP/aGqMZIkR6qvZxJLJDFWyVKgF31ewjCfqFPE2uNJNZtjW
	urs+K5Cq/iNS5pVQfKg28Zs3CDasJVNhp+w00kv0zoTrwr8U/zcjmkVCEnBeCV+CtKoyIM0u1bf
	41GcYfblTNUo=
X-Received: by 2002:a05:620a:172a:b0:939:6c31:2318 with SMTP id af79cd13be357-940ef8d8389mr1233127985a.34.1793040193950;
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067c879sm758709385a.16.2026.10.26.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:43:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLPf6-00000007foP-2hO4;
	Mon, 26 Oct 2026 15:43:12 -0300
Date: Mon, 26 Oct 2026 15:43:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026184312.GA1685504@ziepe.ca>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
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
In-Reply-To: <20261026122243.GA28851@unreal>

On Mon, Oct 26, 2026 at 02:22:43PM +0200, Leon Romanovsky wrote:

> This is needed for two reasons: to save hardware and software resources
> when creating a large number of VFs, and to allow the PCI config space to
> be configured *before* the driver starts using it.
> 
> There is no in-kernel alternative.

Having userspace involved in driver binding has also always been the
plan for confidential computing needs. We cannot have a device driver
bound across some of the HW transitions like TDISP shared/private, so
there has always been an expectation of bind/unbind.

For this case the existing sysf drivers_probe is good enough for bind,
but we must have taint-free unbind for PCI devices too.

I think this patch should be reverted ASAP, it is a pretty major
regression for a lot of users.

Jason
