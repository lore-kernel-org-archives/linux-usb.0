Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054781;
	b=je3TRwJdibiexXNDsNQ9Ny1TtwBYf47Cd0Gbg3UWD/RvAltuyQVmwiH7Tc5Nwmd4tdm8
	 XYspe3oTn1N7K4CtPnkc465oy0Ftctj1Q7UU5vbNLYoMVLZFHvUReP+JRIfv2TK+od0p9
	 NjQBYuE2NjPBxVN4p8TngyaMjvtAqKc4StDI2OiObiVUTVs4XEVUsosjB8pKNiZvfq01A
	 PKFPwskCoZSpadf/KehAAfoSL1n9Hekqawro2j4dukq3BKDtzuvQtz04WZlnpWPDurFi7
	 eye1CY3lRoybm2HdlsFeUWm+4Kh3oro7PtMTYQKYt+4ltuaMBkqx3X+YmlksH6jh5Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
	b=5Xcm6t+Hr3pD/pEUOw4vQir7jDajn6TRr0+RXmd+PVWixeP7mSRoDMW2gaitvGv/fUJo
	 j5j5VoBNMqJkdZHhk9XSS3L3YNXaYOCKT68xg6Jw0U3+lL/Qy3mZYkt6xmUvtmoKdrxEa
	 V4VMLQn4hoPrhqmGFUbXIoxMebcnE8tgFlHD47YCIqxXFMw9AQFekEnhibvtehe7i9kUy
	 DNVxUEGdcSTNohEbM3I4l5oKtA2h6a5WaxjPlpWUZwNF+veHR9GyqdK5XXmTNh7W8qAW3
	 xjOe6Tl3WQ704iVnnwB68SzCla62KX28FHKHOcdf1mYzDwjjrtKyAzQj+QK3+73bhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51803606A323
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 22:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51803606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f1cf92c9eso430062185a.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 15:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793054775; x=1793659575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
        b=FkMZwh2xzPGwRXd/6L6YakG28E0XxcbpH4yKhlkVxLiFKRDjnkg0rF4SuQFtOzIsX3
         f5EydNInmzCSCkyh6zkwX5LrW6pJx+yykjP8eF8zTTd4GpSQj2j9YnRNaZqf70z8RmUZ
         V0j9HOG4zRyyPYbjGh8fDJ0CD1b0yexVSSPmIWU3JWr5lLooPlsfB7nv06CCSg5v12eV
         SoxqEP3dz0sh5FDLSqHEK/sK60fYdYH1JO0HlXuGIhkW+uO84PFYtLiQpk8JsiURcZjY
         uPsNy3n6D4nHtcEj11lG1ob2im6ANFeMkqY+1XCA/fQxPdUxjOQ6lMGPBUzC0mYbVssK
         Q32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054775; x=1793659575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
        b=ld1eEYvWCdf6HtttBd97gcnsQhTjVFZ8HMw2B82BgIXQU6fYvfRSwlkVbwAEscqWxf
         Nz7F/lReV3jkPQGMk5pNl7PJWAXSl8MIexl5+EoCRMDB1CD/J1iydlVOyZBAsblCjujW
         LEFR9Zt8EldcaF0YGHcWy32Kxrn13jWiZn5MU7LulpvgUuRZSF5ICpLBu//3lalOjpr/
         eXxjliVtkJf4JMt6SZX19H88Kkah4RbkZFgIdvYL8xwM9S8sDK3x8+HxNgEhmr412A9p
         m+vXd0gm/93vLilEw716BIXb7441rIvvn+oCNyw1w3WBaCWvlSBuI3D8Auj4+T17qN6Z
         Ugqg==
X-Forwarded-Encrypted: i=1; AKwUvBxy98tLWLd1h53g2kZzVQkgYfIdWNynXrp4q9OYuqszT4NpcqUXs51fg+lPdlU/ao7MUfvlarAxliI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhrk1Ocu+1HI0CVtuIxn0k/sgMVd/ZkybItYbs9WeAjF3cEqxO
	fGM+ZPq9kgExdXlaF/yNW05JN64PGVTCqE036cCmTqZDfEMOFdfx7MInGcPU9XQdl+M=
X-Gm-Gg: AYBFou0Lvu4c/65TrDCQVNnKwZTogMMoxMHoPxsNqVB+e8JXpeH+rpgmhxvdFc6lPEl
	KlcTxRWKINPW5jvTxPzUhiDxANk/UWLaVCgK15rknanP7F2fz5N4AXH4yYKUwNM8nVTK9kOpp86
	OzW0NiW9Ca8r2FYP/TUjaHxhRmChKK7bgsd3+FyikmzNzq6VNLAy6D6CUVKufgHRCC9hOfDp3bw
	TDM+qneivdHGqDrW+xb95aa5ZXBUZTvcYL83Ts3F7zhlQ1f6Is1lT7LTEVlW5gbwEsXiqjROxxw
	v0jqszyzOt2u8bHJDiCrgFUwwUFD2iOQBFqmMgVr+QwY7+k5b8i3tImw4NO245FusfQ7jfQhkXR
	fKldFjsYUhc90OhmMzWv2h0Ziu+KNiZrC9by13YtFJLbu0/YqWHFwHyIjDRb/V2osP7mewjY3hU
	5eU6P/2zR17M5QtWkZoLG5qMHk0gZGpPQoje8xpjRmuqn55Ew00YnZe+RMHfiQXZVkeDIskGpXh
	PceCcydFpjIdOg8tlxPBcb3kuxp+MKk0a7nlGBsNSUs6zGJnp6jre6WMAs5nCrzzwSyasne0SlF
	/vUQ+/9nHuOJdMiOG0CLeyGTPNI1sQT9kmNNlQ==
X-Received: by 2002:a05:620a:4728:b0:93f:2eaf:64cc with SMTP id af79cd13be357-940ef942794mr1259449285a.44.1793054775098;
        Mon, 26 Oct 2026 15:46:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b20e0sm810207185a.3.2026.10.26.15.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:46:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTSF-000000087nJ-1Z9f;
	Mon, 26 Oct 2026 19:46:11 -0300
Date: Mon, 26 Oct 2026 19:46:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>, Alex Williamson <alex@shazbot.org>,
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
Message-ID: <20261026224611.GB1685504@ziepe.ca>
References: <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
 <20261026184312.GA1685504@ziepe.ca>
 <2026102604-tint-catcall-433e@gregkh>
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
In-Reply-To: <2026102604-tint-catcall-433e@gregkh>

On Mon, Oct 26, 2026 at 09:05:06PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Oct 26, 2026 at 03:43:12PM -0300, Jason Gunthorpe wrote:
> > On Mon, Oct 26, 2026 at 02:22:43PM +0200, Leon Romanovsky wrote:
> > 
> > > This is needed for two reasons: to save hardware and software resources
> > > when creating a large number of VFs, and to allow the PCI config space to
> > > be configured *before* the driver starts using it.
> > > 
> > > There is no in-kernel alternative.
> > 
> > Having userspace involved in driver binding has also always been the
> > plan for confidential computing needs. We cannot have a device driver
> > bound across some of the HW transitions like TDISP shared/private, so
> > there has always been an expectation of bind/unbind.
> 
> What, why?  What forces that decision?  What's wrong with the proper
> driver for the hardware being bound automatically to the device?

It would be a proper driver, with a real match. I would expect this to
be done with sysfs driver_probe, which is like bind, except it doesn't
override the matches, AFAIK.

There are two sort of related isues. Userspace is in charge of
sequencing the new PCI features like link encryption and TDISP. They
have complex authentication policies tied to them so the kernel can't
reasonably do it. These features change how the CPU does address
translation, effectively it adds/removes the iommu - and that can't be
changed while the DMA API is active or it breaks every translation in
effect.

So.. We need a gap a system boot when the driver is not bound so the
PCI stuff can be done prior to driver_probe, and a gap if there is a
PCIe error of some kind to do error recovery and go back to the start
to reauthenticate and reload.

> > For this case the existing sysf drivers_probe is good enough for bind,
> > but we must have taint-free unbind for PCI devices too.
>
> Why?

See above. That should be the easiest thing to ask for! PCI is hot
plug, disabling unbind makes zero sense from any way you look at it.

> > I think this patch should be reverted ASAP, it is a pretty major
> > regression for a lot of users.
> 
> But this use case hasn't even happened yet, so what would regress?

I'm reflecting the other commentators, I care about VFIO too. I think
tainting every hypervisor is unacceptable.

But for CC I find myself one of the maintainers for that now and many
people have been diligently working on this bind/unbind direction for
a long time now. If it goes away I have no idea what could replace it.

Jason
