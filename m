Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483A340B116
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764211; cv=none; b=s5yQm2ylLj9oS4MkszZX9mgXUYw6Sfuhmx6+4A2xvO4xBJRRBtiipgbQeI2WNkvdO7wfL3mHLCULsfQkM8vzZx+TNo5bcQMi8Hvx0uN05gwhuHt5lM/MLV5K3RNQ1Us+yc4JD9XNu3TY9tC5CCbCgPlZOgQ9NxeJ1iZ/U57vjjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764211; c=relaxed/simple;
	bh=HryDV6+5qMbLhZY2KERuGiFp2ZKXAOvyWcXmP57Eq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hr7fqkYK15OnbRKhlcUkExZbOK9Gun/F9C/OxIM4cTheAn3SrLY4MlHqqcapWQHMyrtnTDZM0q2Y85HkZJk/wnQvHjKypDABHgom3cCITbJvc/sMDEgRI1ou8knmB+vWUJloUvbTObXTcl32KiupMY/bv/Fn4xA2ru1xIHBn6Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDZeQKGj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDZeQKGj"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so1444658a12.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764179; x=1788368979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=kDZeQKGjuHP6Ge59bPmUk6WLTc+NcJVo2XZ1RnDwli+aHKDJAUteHSksxGVCdR8du1
         bAlX3fA2NcX3AnXBJU7KEwF8QJ82o0afYQ1yoEks10qxCmhjvFJyMRhxUyWrzvpO6Sj4
         e56n85zapKxQLnEDpayB4Oo7O6hkMgnqLhzRvOI04G80GgjzotdM7u+jrApjqOUiDekE
         Sw2qaevbutXor/bcuUNh6UvAQfGa0s64DntC/iy122R2E8qD+Bri8AsE9m8N9GCtjPlL
         X93R02CxR8/3bjmcG4FiYQ3CDYiqIG5ZYYxovOiOxNEKcoITwgL6IdaAjbpsaqtLPPzt
         JmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764179; x=1788368979;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=aTjcdlwWuLvzqkjPpZBAxuIZccS8Wz4EHbDyQvswb17GvXNPO5BFdlVW6Wc2HNzTbM
         RPo17jKM/Zzpiy0mLqYYNDYJdmNe/cmLsOYsKmu3LoIgLPEdHhgZIptJGYCw8Y4V3DO1
         ajGi8F3kfrClBjqfPOLvG8m3UC9a0b3JEjzEpDFzQIR8PeidwGoFS90giQIzPd7Cqn2s
         G7f2okg9b393uRgo4eA7EAbpyNuhtQ084ei99seNP6VNfBFOUowOZ5vy0kCbIir1yTJu
         2G6R7Q6vZVYT6qAwZH2nsPr7wBjmJMg5hSfLxcWJIMCVEnfJaygdNyrLhyyIOPITA88x
         ao2A==
X-Forwarded-Encrypted: i=1; AHgh+RpI0XI7PhVIXvVpiRBKUj3YdPepXbT74YtJETJ7731mOytNX023qEmEMNftqeuVAQsdZhcWjlW1Gv4=@vger.kernel.org
X-Gm-Message-State: AFuF++mUTZc76aiLeyIn0F+6QSBvrDC48Loa4WhZDXAzgxAT3EyyDu3x
	ttBbLQR/R9XOjyPmcQmRmGVGfKIaSLdljY5DUKUaqQgWGISiF9cjo6B7
X-Gm-Gg: AR+sD12fOqPh98DY7dT4fvF3Nt0lJMgSAcLS7M273GhZCDzMo1eBM3I5XABqRCkbNtP
	/cT8DuY1bKq8N+xOakmuWj+XrqofV9/Jt9k176dU1BxGJx4j2nT1U1efOQXwxWCwAjAC4QmqnKW
	W3y1qL2G+Tv1WoIPbophkGCZrj3hsbrMLfoXx064iWorqy5zmH8kQ8hfMTS25T5k+BUtm2ZkAQQ
	HgAHhDOFrPwGgfxrBM0Wypy4LTs5fwqP5ODaQH5f0J94hjXbAWZ3/6p0exkbm4+sjG3emQUtevv
	VsY5RR4LopB8PGoUn9amAEDcfCvAT5ZvujghuthztwEV3/IfUa3ms1IYMgRbktnfg9tqZtajCiW
	mseDqGnEhv95AEUm059Aaac4NOxmuJejxizwaJD7mZW8cvwSIXE6W84cooLlHcC1Xbm5lajAeN3
	QNbcd04/RXZ7me8gOpLfZsjvNLUrdcS0F7f/06XZJHzLOzx3rTDgRM6NNLG9RX/KM8Ad4=
X-Received: by 2002:a05:6402:a0d9:b0:6a1:f092:3c1e with SMTP id 4fb4d7f45d1cf-6a5df6410cemr9897163a12.13.1787764179194;
        Wed, 26 Aug 2026 10:09:39 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm2563163a12.17.2026.08.26.10.09.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 10:09:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 19:09:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826190934.5042b344.michal.pecio@gmail.com>
In-Reply-To: <2026082634-cloak-ambush-3861@gregkh>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
	<20260826153311.6340efcd.michal.pecio@gmail.com>
	<2026082658-statue-census-dc39@gregkh>
	<20260826173549.18c8a89c.michal.pecio@gmail.com>
	<2026082634-cloak-ambush-3861@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 17:44:06 +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 05:35:49PM +0200, Michal Pecio wrote:
> > You can't bind random drivers to random devices out of the box,
> > you need ID overrides. And then you don't need to bind manually,
> > the kernel will happily select the wrong driver by default.
> > 
> > Authors of the recent xhci and thunderbolt patches admitted that
> > 'driver_override' was involved in both cases.  
> 
> I'll be glad to taint if driver_override is also written to, but it's
> bind() that triggers the actual action happening.  Or so the traces
> show.

Well, I suppose probe() is the first victim to crash in such cases.

But if Syzbot is binding random drivers to random devices, the obvious
solution is to ban 'driver_override'. Using that is just cheating.

If it still manages to crash drivers by binding them to appropriate
devices then I would say it will finally be doing its job right :)

> > Meanwhile, Syzbot also found a stupid write to freed memory in USB
> > core when HCs are unbound. You may say it doesn't matter, but:
> > 
> > * USB HCs are hotpluggable thunderbolt "gadgets" these days  
> 
> We support PCI devices being removed, but that falls under the PCI
> hotplug rules/requirements, right?  Anyway, sure, we can fix those bugs
> when found, but that's not the majority of what we are seeing at the
> moment.  Look at all of the dumb platform drivers that are getting hit
> with this on the syzbot reports...
> 
> > * there were plans to alter this code so that UAF is triggered by
> >   hot removal of the USB device, not its parent HC  
> 
> I don't understand what you mean by this.

There are ideas to change some code to use per-device data instead of
per-HCD data. Coincidentally, Syzbot found that this use races with
freeing the HCD and it would also race with freeing the device, making
the UAF easier to trigger after proposed changes.

I gave it as an example of Syzbot doing something useful with 'unbind'
when it isn't wasting time on driver overrides.

Regards,
Michal
