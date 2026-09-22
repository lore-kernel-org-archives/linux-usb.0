Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E9577E4C
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097723; cv=none; b=LJw6rTCUNWC2URUZKSLlh20bVzAniJrvXyGecs+v6iKe7b4+5AW5+NL9QrX/kITnqJ5vHHluQEphAw/xUP6uQ8G4Xs0fQSoB6eYmOvQjRTkwldDv4SYxynhTO1wzf2TeZmUskNIhCweitlGI4cUfD64f6a/2lq+2l81wn649R4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097723; c=relaxed/simple;
	bh=r9jsv8Tj/NRGRSHDpREVf7hC5Izki0ZIYbPt+RpePlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY7+bDscKhLuZVI7HDAZQ61PRQT2MbkJtJmHYbG4Hy0chZHKp5bSGUjvnN9gOk3WpbUo1DwtfgZpHE+/pKsSPnpIWBnouYg57sx8NXnm9DSecw03wUdyTE1HDV5bi8YSAVDIQtN4e3NSGkKP9POHWHG3bzBBpqVSwtgm4SD/6lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdEheXsK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdEheXsK"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so559515ad.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097719; x=1790702519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g51CWbLnarIyJ0OhwzK8Z/JluNHOA330HfdYyzEXpGc=;
        b=EdEheXsKdSTu4t3H0cohiMqMZFOwP85n1ZIkFKeBG2BJ/QHoe/tlaetP3McRWwmxi5
         wG2OIsh+DyhS0F3RpOoBcHE+WQfoPuu5Gmk2rsBUJUpv4EQDPYpiOjxQpKcXiBOGsGDl
         hOiW6R0oAQXXx5u+COYqDaPIBc761UiWxHc3JWJ07Q8KugpRi/bZN7qYMINHtPge7GRA
         /Cmf4tMoxC945/u4cbMw2EGWthtlKcwAIA7arLsfEzXeUNtXCuQWZQirZGPM4gVRsPSI
         0XHzHSM5c9kDqAAwsYY4c/6JNeRf403aMpA5POqx3YP2LtLJIV0IKiAP7f/7ZhgfjFId
         xHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097719; x=1790702519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g51CWbLnarIyJ0OhwzK8Z/JluNHOA330HfdYyzEXpGc=;
        b=dN/BvDmhpibTSZCcoNl7eeHHOb59xGpXfYpPf4AFw2/SpuXp6JfsXq3jKB6hoTpie5
         tGpZyc65k+dgkb6tjn5lzc0XigymJqTZp3JqeLTKG9RUbDwyfJFSJ+gnIH28vengg4ep
         czY2BpQViOv69M/Z682rZzU3auCWh8jM3T5KvoteZ06GDvSpSm0AVXvJr8N4inseGYMj
         B9K7Vhla/JnsMhlkuANdGvdiLNaoY54kEORn8ArMlUt27+AbFqtfT/w6WNrtCsw0j7QL
         3ZoLCX7Ze5quFZ/aJ9P4TALY56Qmq4Mf9wdMPxCw5z7cPhc87i4epQ20rq5gic0EiClN
         SZVg==
X-Forwarded-Encrypted: i=1; AKwUvBzjzkSvuEJHoLDhF7+X2WuCWO3zg1+hZ+3CVj3O7n8bD3UFqSjxczOdH7er8E0+nSzUR/h8752NMDU=@vger.kernel.org
X-Gm-Message-State: AFuF++lFZCFp0Pezj3V0mtyjPxl1fqLyPWhVXnAZf2VaPwUuflLptqxF
	RIu8085dMwLsAhVwRMD5GnQEbymRuRMDz/JRUDMxsU0IrklZJbAz6JC/
X-Gm-Gg: AYBFou2wWYEGPzjGNNIaG3DxgGiDNG3ZJOxWIuLdOyRc68MDkpEKWwhey9e0yY1uawA
	B0iu0gIKug5FDp2j4HP+dfWBcwiSuvnbGaF8jBoqdWcvHrNTgoCjsAZc/mSVdGx7EBfWJyJdZub
	Dpsc8w2EIkFsAW5DYPBSxc/Cwl1J1hnmqUen20jpzztG1ZKaT2uE8EQE4MFJVdAYspm3cWErUZz
	V9qoNpPxP+Tip7dHB7j/OUOy518j2hSEUq2vfauik+jHu0hyL2hK+tNqBc4Rtz/NS2+dSIWRyEm
	mi6vIM5tOOT+2LHwf7qvECmfyopcLMCLuLpzSpA1xVnR8O/YFOr7vEUWTQkNxlw+NgntJ9scgci
	u+9rhAw4fcBctSxzEdwau8qb65qJX9CLEdEfjz+XNt+pKButThSe1QMbB5DiypzvTZt8S4gjNig
	Xup+vQOfv3KMOfp/5OfdAVDAI3tYlR3uSjJ4XMwKRQJf4cOI35IQ4oaZzqGT6Vj3wlbX0X3sdkI
	qoDqgMJFkjf
X-Received: by 2002:a17:903:228e:b0:2dd:ad73:c984 with SMTP id d9443c01a7336-2df69d5ac91mr681945ad.28.1790097718673;
        Tue, 22 Sep 2026 10:21:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm13644575ad.50.2026.09.22.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:21:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 10:21:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rudolf Marek <r.marek@assembler.cz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-watchdog@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: Replace __MODULE_STRING() with __stringify()
Message-ID: <cc03390d-8fc7-422a-bbcf-93bfbb82276f@roeck-us.net>
References: <20260922-module-string-v1-0-c18766690185@suse.com>
 <20260922-module-string-v1-2-c18766690185@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-module-string-v1-2-c18766690185@suse.com>

On Tue, Sep 22, 2026 at 03:32:22PM +0200, Petr Pavlu wrote:
> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
> MODULE_PARM support for older modules" [1] in 2002-12. That change also
> moved it to the graveyard section at the end of linux/module.h
> 
> Replace the remaining uses of __MODULE_STRING() with __stringify() in
> preparation for its removal.
> 
> Link: https://git.kernel.org/tglx/history/c/136839a1b4 [1]
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  drivers/comedi/comedi_fops.c                          |  5 +++--
>  drivers/gpu/drm/drm_fb_helper.c                       |  3 ++-
>  drivers/hwmon/fschmd.c                                |  3 ++-
>  drivers/hwmon/nct7904.c                               |  5 +++--
>  drivers/hwmon/sch56xx-common.c                        |  3 ++-
>  drivers/hwmon/w83793.c                                |  5 +++--

I don't know how other subsystem maintainers want to handle it,
but please send the hwmon patches separately; I'll want to apply
it through the hwmon tree to avoid the potential of merge conflicts.

Thanks,
Guenter
