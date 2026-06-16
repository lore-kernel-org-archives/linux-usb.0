Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548FD379987
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620093; cv=none; b=MxB+/SCvnHa/F3GvaAj6TmYUfoPtaO+15FEurLYsn0bUcxlwxJopWFwbTnNZ4KMRmVqmT/R2IR/incGGwffZ33zL80ITxckwWUdNfRvYfOEbQhVvxX6PUknAp8pTE6zNDQDqw/BZu/Tb/JuHt/kLU28QGX+crnPggEuiGrvG5PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620093; c=relaxed/simple;
	bh=yvUtyGChRITdacoZi2gl3Px5RNLwduZ1sP3kH8lYtxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2Y3XXeZO+tidQPkfvetUPX++i3upUAc1YuXtxtf0GEq5FCvecoR+WQ/V/eWpO2TFFY4/vjNnZly0tH3SrSiGob5aV6yiDrsa/b5EXoVrnI3kcsxCry4MEKNc+8wbWA1Jm7+//4r3EpDDfdNVDXEABbfu07ZyNJohi9b38tAlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZtQ3S2lg; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZtQ3S2lg"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51775f2473aso35232301cf.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1781620091; x=1782224891; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBzxltYFB5IlhH9MRB9F4u0mC5z3CJixmHvtZ6C+QV8=;
        b=ZtQ3S2lg+R58dMhjFI9tb2F5ZIzHQ5AqXdxiUnEdn+ZuLdneiX1VIpCVXa5Y92nszX
         3B+RjNPtaGJtdrt0ckIrM7mt7JqB4HuS5KkPnSGRa5bBkp6lDeEz8W5ELrRkdRMOtRGu
         YR/Y9lhRFyS76mYlzuXuE61PazZjbxxm9PVPGiny6mBgDXkkYbCe//xVHxWiR2ifJ+6n
         x+TSz8O/i6BcGDo/g476DcUb3ONCLO1JxkO+2hFR/DTfWYVZuiOSIGPHYg6p9cC6U8xz
         K7+gM6B5toYV+tJp6Qs6pChlcB4paEYtkxeBnwtzsdCL4p7zqs9K2WpZc3KRk6nCsgA4
         E6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620091; x=1782224891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBzxltYFB5IlhH9MRB9F4u0mC5z3CJixmHvtZ6C+QV8=;
        b=cvbqZJ/6sN7Sn2J4ilDBUYUY/xHju0WgkOudXD3SGYKdKFiGzDZBJrpaP7xFTWXuYo
         4Xx4rWgMmvxTs0pUKgpMrQCuLnT4E4s10nzxaJHfXhLfc65SZZHxuJJvEax0ks7Awpxi
         i1T8bproSs0KYtWUZiXYBYidb/ty7uO5Xm3jGdd62bX+j2nuDW/p+nMiwovENurs0asX
         7z9ZinljkMHTfVG+6LpM5tyatl1N59FbgxEXK4R8E9hzsXYWXsc+qKMYcpp6d7A8LQjx
         wuIQ9CYFH+Fx3N3DC1CuLHGe4VpSQGqlzINxN3jtwTjs0Q5L39NK51t6rihaSmbsYWE7
         j8Yw==
X-Forwarded-Encrypted: i=1; AFNElJ+8s69iJZogRqrg/IpGYuHhT/QrNqD0nnnmvxT5jyTQ72FaZA3BLB2NDUPUroFFnsqWJh8LEAgf5BY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMZpM3YB3o42X6/K6Ud4DOnkVq0e0AtWWiok6G2543kIPDoc4B
	2Dkqm70HFPLK+zv5i4o61rHpQ3I/m5VxKG0C+37Em40iv28lNFO6BggLU704VdvBZw==
X-Gm-Gg: Acq92OGe49xVzXs2o8+jiDTdgu4lePn0XYKkI6qkLbPoEr8Cewk40jdUwVFXzoZgYe2
	j3z5C9AgtaxAb9MqWmHlLqQuPvX57f+/E/+sCmgO0ni7hic557yIy+JC1n5SnQ6q5z/FON/XPZt
	QPGBHcIcA7GAGBD4b/53Ryw72yvcLn8mbHfZ8EloPv4QeNoCElNTh7NwOGG5W86JHrD9Navk4HP
	MtlAzsdOmh3L2n4MuLVsQH5NwznYfH+Izf+tLVyqEZ6+nT91oNtSxaLXfplTW6IYybTyiE2d3Hv
	kLnrcPOvyryGYICtSF3XJE0a8GMuQvJHZRvf0uksG6H0zwEel+Ts1MAlzll2T2NAhTOXN5mfVom
	rUtun/UpH2MdtDWgg6QPa4tYrpxUdzZpjF37OWaHhTFtW/6EbVKOxd7lB2Mr1/trMTvwCDavHpj
	V6Bpt3G31F9/iURCum8hn5cb4X/wZvcixMRCc9eOHbZpI=
X-Received: by 2002:a05:622a:2c8:b0:517:5ffc:4a11 with SMTP id d75a77b69052e-517fe4bc675mr269519021cf.36.1781620090787;
        Tue, 16 Jun 2026 07:28:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51955b271fbsm107149761cf.22.2026.06.16.07.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:28:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:28:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Jimmy Hu (xWF)" <hhhuuu@xwf.google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: Fix NULL pointer dereference in
 gadget_match_driver
Message-ID: <adbaf493-fe24-489f-9ad5-87eacc7c187e@rowland.harvard.edu>
References: <20260526070635.839701-1-hhhuuu@google.com>
 <1f7a7bf2-4d21-4944-9da0-36082d052b25@rowland.harvard.edu>
 <CAJh=zjLLrY-NpV-ZcmH0V6q8CjNuKt7CmW-GEFQ8_y3zm9v1yw@mail.gmail.com>
 <d0042def-a513-479f-9742-12942346cd5a@rowland.harvard.edu>
 <CAJh=zjJqarEkrzajpdcUAZwOxisbdrwTPwX_jHWzuWZFSQ16SA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJh=zjJqarEkrzajpdcUAZwOxisbdrwTPwX_jHWzuWZFSQ16SA@mail.gmail.com>

On Tue, Jun 16, 2026 at 01:14:03PM +0800, Jimmy Hu (xWF) wrote:
> On Tue, Jun 2, 2026 at 10:30 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Tue, Jun 02, 2026 at 01:34:07PM +0800, Jimmy Hu (xWF) wrote:
> > > On Wed, May 27, 2026 at 2:00 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Tue, May 26, 2026 at 03:06:35PM +0800, Jimmy Hu wrote:
> > > > > A NULL pointer dereference occurs in gadget_match_driver() because a
> > > > > race condition exists between the DRD mode-switch work and the
> > > > > configfs UDC write path:
> > > > >
> > > > > 1. The DRD mode-switch work invokes __dwc3_set_mode(), which calls
> > > > >    dwc3_gadget_exit() and subsequently frees the UDC device name via
> > > > >    device_unregister(&udc->dev).
> > > > > 2. The configfs UDC write path invokes gadget_dev_desc_UDC_store(),
> > > > >    which calls usb_gadget_register_driver() and subsequently
> > > > >    compares the UDC device name via gadget_match_driver().
> > > > >
> > > > > If gadget_match_driver() runs concurrently during UDC unregistration, it
> > > > > may access the freed UDC device name. Once the freed memory is zeroed,
> > > > > dev_name(&udc->dev) returns NULL, causing a panic in strcmp().
> > > >
> > > > I don't see how this can happen.  gadget_match_driver() runs during
> > > > probing of a gadget, which takes place only while the gadget is
> > > > registered in the device core.  But usb_del_gadget() calls
> > > > device_del(&gadget->dev) before it calls device_unregister(&udc->dev).
> > > > This means that at any time when gadget_match_driver() can run, the UDC
> > > > device name must still be allocated.
> > > >
> > > > You should run more tests.  Add debugging printk() calls just before and
> > > > just after the device_del(&gadget->dev) and device_unregister(&udc->dev)
> > > > lines, and inside gadget_match_driver(), so the tests will show
> > > > unambiguously when these things happen with respect to each other.
> > > >
> > > > > Fix this by checking dev_name(&udc->dev) before calling strcmp().
> > > >
> > > > Adding a check like this will not fix a race; it will only make the race
> > > > less likely to occur.  It won't prevent the name from being deallocated
> > > > between the check and the strcmp() call.
> > > >
> > > > Alan Stern
> > >
> > > Hi Alan,
> > >
> > > Thank you for the review. You are absolutely right about the TOCTOU risk;
> > > the simple NULL check does not prevent the name from being deallocated
> > > after the check but before the strcmp() call.
> > >
> > > I will submit a v2 patch that uses get_device(&udc->dev) and put_device()
> > > to increment the UDC reference count during the matching phase. This will
> > > guarantee that the UDC device name remains allocated and valid throughout
> > > the entire duration of strcmp(), eliminating the race condition structurally.
> > >
> > > Does this approach sound reasonable to you?
> >
> > No, because you haven't addressed the issue I raised at the start of my
> > email, namely, how can this problem actually occur?  And you didn't run
> > additional tests with the extra debugging information that I asked for.
> >
> > Alan Stern
> 
> Hi Alan,
> 
> I have captured the KASAN log with the extra debugging information
> you requested, which shows how this race condition occurs.
> 
> The log shows that after gadget_match_driver() enters execution on
> one core, a parallel core can invoke usb_del_gadget() and complete
> both device_del(&gadget->dev) and device_unregister(&udc->dev)
> before strcmp() executes.
> 
> Here is the exact timeline from the dmesg output:
> 
> 1. At 268.595241, task 1374 (configfs path) enters
> gadget_match_driver() (on CPU6):
> [  268.595241][ T1374] [CPU6
> android.hardwar]:[JJ][core.c/gadget_match_driver/1568] Enter
> 
> 2. At 268.595250 (only 9 us later), DRD work invokes usb_del_gadget() (on CPU3):
> [  268.595250][  T102] [CPU3
> kworker/3:1]:[JJ][core.c/usb_del_gadget/1529] Before
> device_del(&gadget->dev);
> [  268.598129][  T102] [CPU3
> kworker/3:1]:[JJ][core.c/usb_del_gadget/1531] After
> device_del(&gadget->dev);
> [  268.598159][  T102] [CPU3
> kworker/3:1]:[JJ][core.c/usb_del_gadget/1534] Before
> device_unregister(&udc->dev);
> [  268.599405][  T102] [CPU3
> kworker/3:1]:[JJ][core.c/usb_del_gadget/1536] After
> device_unregister(&udc->dev);
> 
> 3. At 268.599427, task 1374 starts comparison, where it triggers a
> KASAN invalid-access. (Due to kernel preemption, the task was migrated
> to CPU7):
> [  268.599434][ T1374] BUG: KASAN: invalid-access in
> gadget_match_driver+0x150/0x1cc
> [  268.599448][ T1374] Read of size 8 at addr 66ffff801a49b880 by task
> android.hardwar/1374
> [  268.599454][ T1374] Pointer tag: [66], memory tag: [fe]
> [  268.599456][ T1374]
> [  268.599460][ T1374] CPU: 7 PID: 1374 Comm: android.hardwar Tainted:
> G S      W  O       6.1.124-android14-11-ga633402dff84-dirty #1

Now I see the problem.  I had thought that the gadget device would be 
locked while gadget_match_driver() runs, but it isn't.

> To resolve this object lifetime issue, I see two potential approaches:
> 
> 1. Protect the UDC device lifecycle during the comparison phase using
>    get_device(&udc->dev) and put_device() (as a lightweight fix).
> 2. Serialize the configfs match path and the unregister path using
>    a subsystem mutex.
> 
> I would highly appreciate your thoughts on which direction you prefer.
> Does this data address the scenario you raised?

The problem is to make sure that the udc structure (and its name) 
remains allocated during the match.  The best way to do this is to have 
the gadget take a reference to the udc when it is added, and have it 
drop the reference when the gadget is released.  Not take and drop a 
reference every time the comparison phase runs.

Unfortunately, this will require changing the way we handle releasing 
gadgets.  The gadget driver's own release routine could be stored as a 
pointer in the udc structure, and there would have to be a new 
usb_gadget_release() routine added to the core.  This routine would drop 
the reference to the udc and then call the gadget driver's release 
routine.

See how usb_initialize_gadget(), usb_add_gadget_udc(), 
usb_add_gadget_udc_release(), and usb_udc_nop_release() interact -- that 
whole arrangement would be affected.  But it wouldn't be a horribly 
complicated change.

Alan Stern
