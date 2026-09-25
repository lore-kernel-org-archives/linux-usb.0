Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B84F648C
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371172; cv=none; b=EWbFgm7pN23ATudvRL7g/jZkigZ6nj2AYn+075XalL4JQz5nGhJHvVoiNvcXfAt0hNjHKXERCzVguJ0JxhpxYd/1mGSJFC0P6+4C7Nw2kH7/jCjIhwBSlhtS9GT6sUnUTztRHcuvJbg+xr0/obzdjHjltVyxbt3pehYaOITQP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371172; c=relaxed/simple;
	bh=+ycUu4Lrfdhzd9jKGwQrR5OBQYug2brCLTLBMKycAlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufOiQe4OwWhSrsksj8iU/xCqGlUeyy0XMKmN1kS9TM3Hpcy5vrV3p0svEtCE8w6CXXW3U+2o19wKnQuRh5eUUDo+d7+ib6TcR86Li8WcdHSBkHyelCDCOqH8nB/el0v1UNpUHyKtvPKve+diRbfKFg9gNk1yUiEyxOyCpxna78w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcgtoNnN; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcgtoNnN"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so358059eec.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371170; x=1790975970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BSFDJmV96PMiREIfL8Vp0Pof+pF3vE7NpaMcF3TO54=;
        b=BcgtoNnN7tyT5vXhQxH2W/svjj04rjfZBk106Yx5Ud7AdBiH36T4d3HMQw4OKcx8Sq
         NSM1vLK6E71a3ci5ofu6g4WdMJ9lDPD/0Vcx/FyPu6F9VzovP6Lta6Wlt01yttgWz0W1
         8Z3YgLtmzsDiboBvrDdfOWCFsKNWW2peKDw801gsQ4fYGmg1QBitC25naGpcGWZB424v
         Hk44SSp0/6Ie3W/gSdfw1W9BxtikJ2//by1ti504vamhy+Imv72w+IeZgrh8gJHy3a+/
         ReuZTohoTELW7MiJjEDd9lcTjXHtDCM80++FO+XxJ4oRlHFEYa/ejek8AkAeRZpBlYOg
         fr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371170; x=1790975970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BSFDJmV96PMiREIfL8Vp0Pof+pF3vE7NpaMcF3TO54=;
        b=prV8HcoKSNEgAesM6z+aNz7Glj6MgEN5UdQZ5lXzx2s9+BQE6Bh3wv0dvVmS9aUiYn
         WqehNMdlUp/ziygiW7yQozloOS7rdmoYDUH30r12bP+QJMWUJIatpiydtF+uuC09p53E
         Vevq+ykw0bxtnz0LMLWMNGMzqS69ZhCoAiDTra00ACn1UJHK4CwOP5wSxzccdgVr+V6C
         QmzaStDAlKEtM/6dviL+I5qKb+GSQQATHx8AkXcKiS97YvPlRJAjOJysBIORaLWcT4ni
         tK2ZKpHjbLgD9vhUbJVh3C28rUOui4gBwVq5p6qtD+/IbPzkEBnlYDm/P2dWhNOUZl3G
         C4Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxW/wW80e562h9JkJNHrXAIo6feKDrTzVubGpLb+513LPVJhZ1X/6xv/0v+I/Qr1dNSKqkAMEes08c=@vger.kernel.org
X-Gm-Message-State: AFuF++knyfMBKl+dpe6AJFQCrzYif2+vjfYKKBYYIt+mEafqh6ITVbzA
	Stx4VCkeKufA6+1rXCkEicn7i9LLqoOZazNOAB4OsE8qPJTR+oboNUnx
X-Gm-Gg: AYBFou2UIkv1ftweqWM2pbh0LODPpA1OEBcjELQWbRxQuvfMk6z0XtFIHPbDBm3LbMS
	oyvEKpd6qBm+xcOLS+UjBok9D1pyXfiJvE3E6A9c504Y3LcamVCrW2Rk0HaETMmSz7oyzbd2nxy
	RH+IuiTIXWBAeAzNSzn2kw4tBMrAhPeBLeYuTQylhWOzDBdF13FYAxXtgQRkQ52w9Z3DewuvZ/m
	08H3HNQDEfm+cZUdx4pJ9F/OnzBQ92DgYpMUVfaipg2mqXR752U7QsjdR0SM/JcP3TA3i8D2MwF
	7YdZcX/HxoUl/tMJRaApEA+rSb/6ENKR2xJ6C2AXdrS/aDoi06yxIm66yFBi70zFHcC2UurqQMv
	eqAyGM0nhumVv24aIPxOel8dl7vd9T4Mc+6Zq10jW93cVUsjujsnbEqeXgMNFkFb68KpCjaZ0aJ
	+piubuxf0aho5D4McUPRlJp5aSfjm56sKzAw8o+IqPuv6+9lPfr0V3eF4XbuQNApRaIgldNjDy3
	jO7YIZdTVdxcBkzxCwPSqu5XzXS4j+ipaFw2Mc=
X-Received: by 2002:a05:7300:dd48:b0:33b:eb33:9f70 with SMTP id 5a478bee46e88-34272a41d89mr1027757eec.37.1790371169410;
        Fri, 25 Sep 2026 14:19:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3416e4c2f50sm8029385eec.27.2026.09.25.14.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:19:28 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:19:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <arbkvK54vT7SIyjV@google.com>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
 <20260826-bind_taint-v1-2-52b05f4a965c@linuxfoundation.org>
 <apA8n524yIn-g6ep@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apA8n524yIn-g6ep@hovoldconsulting.com>

On Thu, Aug 27, 2026 at 03:33:19PM +0200, Johan Hovold wrote:
> On Wed, Aug 26, 2026 at 11:19:33AM +0200, Greg Kroah-Hartman wrote:
> > The ability to add and remove devices from a driver through the sysfs
> > "bind" and "unbind" files was created all those decades ago as a way
> > that kernel developers can iterate faster, and provide a debugging way
> > for users to attempt to add a new device to a driver without having to
> > rebuild their kernel.
> > 
> > This api over the years has been abused and recently come under a major
> > fuzzing "attack" through tools like syzbot which decided that it would
> > attempt to just randomly bind any driver to any type of device, causing
> > loads of unneeded errors and pointless kernel patches to be generated by
> > unsuspecting new developers.
> > 
> > Handle all of this by adding a new taint flag, TAINT_FORCED_BIND, which
> > will be set on the driver if the bind/unbind sysfs files are ever
> > successfully written to.  This lets kernel developers "know" that a user
> > is attempting to do something that is not normal, and as such, if the
> > kernel breaks they get to keep the shiny pieces laying around on the
> > floor.
> > 
> > Note, the taint flag gets set _BEFORE_ the bind/unbind callback happens,
> > as many times crashes/oops/warnings/failures happen within the callback,
> > and the taint flag needs to be there to show what was being attempted.
> > If it were to be set after the callback happens, the oops report would
> > not properly reflect what foolishness was being attempted.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> This makes it clear that this is a development tool, and it is a good
> compromise preferable to adding unnecessary complexity or suppressing
> the attributes completely just to prevent root from shooting themselves
> in the foot:
> 
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Tested-by: Johan Hovold <johan@kernel.org>

bind/unbind without overrides should not necessarily be treated as a
development tool. For example with I2C devices you may want to unbind
the functional driver, perform firmware update from userspace, and bind
the device again. This will ensure that driver is not confused and at
the same time you do not need to put into the kernel code that is
dormant 99.9999 percent of the time.

Thanks.

-- 
Dmitry
