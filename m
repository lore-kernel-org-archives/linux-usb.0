Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055307;
	b=dwTIrFzU8qzXkl0aF0Z6yhQ5qA6G06FWCMUyzfwVYZLFJD/47vlTo8hHzpZb/yj4Mn4L
	 yWmw0IR3x1UG9G9TOMP3PwSfKuoHxQ/31xwdWwPhXUcYE7DnYSpk2Pj0hkcSHzFKDyaEE
	 DT85Sp5CHB+vi8sc30bSWxMV9jKAi0T+Rc+kQjsai0XbCvHO7EZn6MGqg72FoOtFPuI8w
	 xkhGLyrlmM27Rmhy2NisB4ZQuOWUIcWRcWxm/GH3E81fRh5zUyZSxDYdmtiSb6WFmhP2G
	 ZFwXLORl23aV6ZQ9L756+BdsbER6iKNO+/yvUNw2Tu7jett6dUnHRgReo2xCY+feskA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
	b=uTUSZL3VuKnrgGNMrN/h/AWUTZKREf7vjzUuuywHGXG+8JaABSK/Yh8CuMbmnU12BQ2/
	 XJcaw+Qxvssk5IaULlMU+2qBHtiEUcAZSu6kOa+B3no5M8MBzHz5G+D4JSI8qdvFcrh3Z
	 GxG/CdOYfRb98G1bgk+ODsFMjTQtvT3oG+qNGGTIap2dkHiAPU3UwxptWsLYQfhFErKzQ
	 xXdx0vTpsQ7pvnD8e7MlOompcnX3u8h/+Tv/SLDZFJoOxzWV9c7nAMpmfFXaQbljBalDB
	 PG31419/uekq1FKbEbovk4t1LzLzJPw+8xxk8mAtRBDswISE0LPb4DvBDudVTdCMBfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iE1vhkuf;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE14606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 22:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE14606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iE1vhkuf
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53bb57f1310so16978891cf.2
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 15:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793055306; x=1793660106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
        b=iE1vhkufDNk47J0y0sfQfrcXvv7YwF5xZFg9Zgo3GIzWAPWbTFVaeyw2U0dtOlPag2
         5dWMf7SyNSgNhsm9D6diSHIdA69bKNuWJ33g6Ws86B/FXC72+OUoK0GlOXNcOXMMUb7j
         vEQdmCqpATKVE6+OWcRHTpwNRrYJBNMNiiH9SbBKxx83oBE7NDzOB6NP/kzPMrB7tS1u
         BJ8R/xA3Vtfw1W0CvF40clDWUJO6jz0fi1k5djJewrxA40gh6oNqWlI/rreVaHKQhFSf
         2D4NvJf4yKKhk9yrS9MArPN93WnWZW895J1xZMvYhJ7gHZqrZyRRpjbacUJzAeaZicS/
         ct0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055306; x=1793660106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
        b=UyhcZUDjxtnl+fVV3aPlIjJDS0aqKWsnZuI7+nhaEwySFRHyV3FdRQMzHj05yCrxqM
         NtC8s8m30uiGfE58P9fpuntY/2SGZB/W5y+gTqWyMbcIM/YuZx3JONPfkvwxD5WMFGAv
         HExHapvAq2ZUJIn6zLbe9UxJYzJaO05BMV9mjip2FxBNwkjiUX/tIsYDgGuk53T+LO8Q
         us07TT5sFGZgR3QfrJPmn3N1D5DCL+D4H+DRXM2iMMTh1QRevjTAO9wXBla2anLjOPr7
         DA6HLVo3TJ/QEcXvoQ+z5CnqiuBkWLxCn4WF6C4/Ybeiiaw9OLW77r14SKHgY5jy47rk
         8ORw==
X-Forwarded-Encrypted: i=1; AKwUvBxAcywl6K7LIHtXkoiIcdbkxw5Xysd4pxz9lM1BeRJzuKfjtKR242WihPD7rZweh/LrI/ZghtiQ0FE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGVDwmw2jtgE6XwMb1tD2TstkgpUiO8sJ+sLsy2Ddrjk0b+/LD
	kpBKEaaEkzR2rrHPAkE0cNEmnmP5ym6vHwm2aG7RrNUD8ifcrxvnhcbSYwhmV45/2V0=
X-Gm-Gg: AYBFou3ciNtQNWHC9TdPkqh0QRoq9NWrMAcFyUdbBFzBClCedptQ7SyOFEj12n5ctDj
	jKq/6E0PRHMjj3PDYxwzVYNT3FtpTx0nBSZkzMpdyqIQ9NHvZH38aWBSocGPNSQdFVgRHe+8D5/
	9vmkOmA+sOsDYRAX3aT2MC42/wWAjv2gv/OVerBWb/ukxCcGgOw/tcNFoG7Xo/2KwR8dmDuZtCq
	T6JiKr6W28zPqk9+4qop8KuZxxZP1ItVD10W0pnLXv2Zd6lG9njNUQ0TSDT/SWUPzYUlMTmPwIR
	Fw+ksvUaJ9qo9HE84HfchIw7KeepgKkHlNYLY+ohJzQhvKUXjHxX7fslKJHOMGDmW7NhaORpk4b
	V+EgFhS3uZz4vFWSehWAOE0fdl8rPUfqB4auSe2o7WX+w7WpwmZlh7Tbi2KhhbgBZI91RDeTeoR
	2wbZJqqGmY/KrW5kJVJs5SOsAC1QcCJ0dcjdsRnFLAVBmfyrVk7dTHxntEyM5+zvhDOJx/MKGyX
	VJYex5c7dGAt8ewIRoZ1YwZO4pe9PmCpUetJis659KCNQ5uWQVYFavTUfu2dxVSn5xNs5uPg6mA
	4yYZrV4dEUSGWuzNc5xDi/IhXzuz63Af3p/jRg==
X-Received: by 2002:a05:622a:4b18:b0:535:80b:9911 with SMTP id d75a77b69052e-5383b4b0e1dmr122069761cf.24.1793055306222;
        Mon, 26 Oct 2026 15:55:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c565esm66284051cf.6.2026.10.26.15.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:55:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTaq-000000088rN-3CrV;
	Mon, 26 Oct 2026 19:55:04 -0300
Date: Mon, 26 Oct 2026 19:55:04 -0300
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
Message-ID: <20261026225504.GC1685504@ziepe.ca>
References: <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
 <2026102654-enlighten-perkiness-193c@gregkh>
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
In-Reply-To: <2026102654-enlighten-perkiness-193c@gregkh>

On Mon, Oct 26, 2026 at 09:27:25PM +0100, Greg Kroah-Hartman wrote:
> > > Sorry, late to the party, but this isn't a few user scripts that rely
> > > on this behavior.  Effectively every use case of vfio relies on this
> > > behavior.  We rely on unbinding the default driver from the device
> > > before using driver_override and drivers_probe.  That means every
> > > hypervisor with device assignment and every userspace driver use case
> > > now experiences a tainted kernel. That seems like a significant
> > > regression.
> > 
> > Sorry, I was on vacation and missed this change earlier. This change will
> > affect SR-IOV deployments around the world, which *rely* on being able to
> > bind a driver manually *after* virtual functions are created but before
> > they are used.
> 
> Why can't a real driver bind to those virtual functions?  Like is
> happening in the rust apis?

Most people using SRIOV will bind the VFs to the VFIO driver.

The rest, it is the same as the CC case, there needs to be a gap after
creating the PCI VF functions and before binding a real driver, with a
proper match and a correct id.

This is usually managed by clearing drivers_autoprobe

Ie look at commit b8c5cec23d5c ("Driver core: udev triggered
device-<>driver binding") from 2007 explaining this workflow.

The taint on sysfs unbind makes zero sense here because we can trigger
unbind of those VFs just by disabling SRIOV through sysfs. Should we
taint that too?

> > This is needed for two reasons: to save hardware and software resources
> > when creating a large number of VFs, and to allow the PCI config space to
> > be configured *before* the driver starts using it.
> 
> How is hardware and software resources an issue here at all? 

If you create a 1024 VFs, which is what people on big servers seem to
do, then that can use 1024 x megabytes of resources to load all those
drivers which will memory exhaust a hypervisor.

This is a real case actual users run into, I saw the support requests
go by :|

> And you can write to PCI config space from userspace today, 

Not allowed in lockdown, triggered by secure boot, which pretty much
every server uses.

> > There is no in-kernel alternative.
> 
> Then just don't have a in-kernel driver for the device and all is good?

What? How do you use the HW then? Is this a serious reply?

Jason
