Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCD33B9D98
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371485; cv=none; b=Ia8gXyT36lDMp1VcbWvVQLc2lZq+hXiCmUdou03upUhuPuOG+F0xrWvIYggCWbbN3vu/mFLkjvkDr1ocMU305kJWOlGyqWdk6OufyJAnpJmWLYB3UMI2Fw7/PhAFX9bd1N56/xQcbcWpktnqDHIl3DsdzXRABzvjZwbsjz1DEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371485; c=relaxed/simple;
	bh=6UCbS+9HBjPH+ly6SrFz0DNteyZrAFKy25237yQ+dHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guZl+o8NtuZU3eKTSo4HhXn2EpyMQLsvL+hysSBMxEWqI1vyKN1Oua2axCbTl+/FDHqob3r/dZ/hoBMNqs7J5hsOL9RPN1IeUYnzbq9Wp71mJMj12MYDUufLLEkK5odHc3ssNuE3rxSx6+8VcCaPQqebus9gnpE42k87gdTpZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uzpLxZ9M; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uzpLxZ9M"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c0ecfaee7so12256971cf.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786371483; x=1786976283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v5kLAJvK86TEuX8U055kdZhFrlrED4hgi1Ae4CsMpXk=;
        b=uzpLxZ9M2ezjueuFGRDrLrQgmBiGfntCJHiCK+3ySkVfrOxbJl0md3JvCv+EcSNJA2
         shSxWO1/cxSqI1mF5zMFh6FXGJROGkEDUE9xpsrG+WnLXaDzmaF8pWrhD3GEhLZh819b
         qfsfb0G91LHFv2G8OWP4UvwO16D9xvZvD/CRPVhrQR6DfUlkCDFjlh0DZtx1/no+KLU+
         fkFTSsNlpAMEUNhVlztCzHol/Kae+g4owPHMmDGsFmp+i3cLdggEp8oT2tsx/eToB4nc
         jGzNqgV6nq59iP5cgI9hAQGYsoy8iaVMaPaEnz6sjpoZ7cqpWj6m275MTY1/Yn9jk7eq
         bJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371483; x=1786976283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5kLAJvK86TEuX8U055kdZhFrlrED4hgi1Ae4CsMpXk=;
        b=gR/d0nSNZiUTHAZhgCfYUiiaowePUkxU+rHzoQ4uXi4I8yhQxsBMrbEoGmBxJoQ3l/
         OfIKuPAYJwSGmkrBNwzf4tvYgQbTsjb7BMeiLR8YWoZajrY6SJCunXF9UUWygNB093C0
         NPc+63v9rFkPgpRfuLLTriqbBnml1nyFskax9evtWPQ0bONX4gLWa5i2eBx+N5IkUBmS
         wnbOop16dtglENbLXnVuUGFRg4ipsQTuppokszmEw2yo4YvLWiEakJWixVvWas4JBCve
         dYsZsu373XEyZrH67QJJ/xtkoNxLcDwyjNPVdoOlxiDVH/t3tIuMxZhADDbh7onSseQp
         oxNA==
X-Forwarded-Encrypted: i=1; AHgh+RoRuKCoYOGfDYQlIqc60v6Ho2wyjT0+OOl1eR8KFVt/jtnIqQPcVf9GDL4VHG/MqiKp7+5Q5nIBnJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe0/4HubNzJvH7+mkxZcePN6b2gOy0ItSJKIkk25DeIiczSoQI
	2h4CN1zlytRBjh3/Tbh4IZRLx0FfeGZbNWUcETx7dWkS7MierN5FpZ+r0HSniIMSZA==
X-Gm-Gg: AR+sD10WrXRK7hnV8Mnv/tg6cl4PVLBvBqa1a4AsyThCWRdlaYOwfiwdRCTfx/be+zD
	AAHNKBdzBrd6C+vzInZnnUrHe6JFdvSPJ83VX2p5fX9cN6vt/1zO/oCUUzF+M50F7kOqqbdr5bD
	7m/DddUWX8XDxpHeSIBBrKiPMJuXHKUKtGo48PlPGHu9+jF5hRs3EEMRg0hlJfrfP4GvYikvQyq
	yanjDe4n2egugBhR6WQcXDLwYYXPexflT9ZAUxIB/17SeTY64j/wtdv9P6tdibxXbei4cAqb5IY
	NEC/mdbrKWhaCIwNjS8tMGOm8CPAXQsXDYjjWGRyGv95k883olHx3L1iH29X1qv8AqWinWDI0s2
	+/pmvYFyYFOla9VZJMMahafW5DqHKvDkq4bsC8p8BYneYb/NnqQoUnTeHRSKTnEXGuzjZYo9y3q
	xpA5T73xqY9ia1/Jw1Hd+pXryATOJBfM982UNIWuo4/kq6rBlIAKyu65/ASlp3jRdDibt0soNSv
	BOT4L4=
X-Received: by 2002:a05:622a:408e:b0:51b:f857:cf82 with SMTP id d75a77b69052e-52d4be1abe0mr23120741cf.8.1786371482940;
        Mon, 10 Aug 2026 07:18:02 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d16335094sm72374311cf.3.2026.08.10.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:18:02 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:18:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ZW Tang <tangzw515@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] media: dvb-usb-v2: gl861: WARNING in usb_submit_urb due to
 bogus control direction
Message-ID: <0608a6e5-2f77-4153-b3f3-a865c6deb84d@rowland.harvard.edu>
References: <CAA2SOT4pewLwoVkCDsT48QhXTbz_j5MZCuO1QL8dde4NGqtfDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA2SOT4pewLwoVkCDsT48QhXTbz_j5MZCuO1QL8dde4NGqtfDQ@mail.gmail.com>

On Mon, Aug 10, 2026 at 04:21:20PM +0800, ZW Tang wrote:
> Hi,
> 
> I am reporting a WARNING triggered by a syzkaller reproducer in the
> GL861 DVB USB driver.
> 
> Although a similar bug has been reported before, I can still trigger
> this warning on Linux 7.2-rc3 with the attached syzkaller reproducer.
> 
> The warning is emitted from usb_submit_urb() because the USB control
> transfer direction appears inconsistent:
> 
> usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: CPU: 0 PID: 4359 at drivers/usb/core/urb.c:412
> usb_submit_urb+0x117a/0x18d0 drivers/usb/core/urb.c:410
> 
> This looks like a driver-side control-message construction or
> validation issue in the GL861 DVB USB driver, rather than a USB core
> problem. The reproducer creates a dummy GL861 USB device, opens the
> corresponding I2C device, and issues an I2C_SMBUS ioctl. The execution
> path reaches gl861_i2c_master_xfer(), then gl861_ctrl_msg(), and
> finally usb_control_msg()/usb_submit_urb().
> 
> In the observed crash, the driver submits a vendor IN control request
> with bRequestType 0xc0, but USB core reports that the control pipe
> direction does not match the request direction/length. This may be
> related to insufficient validation of zero-length or malformed
> I2C/SMBus read requests before calling gl861_ctrl_msg().

Many USB implementations of I2C cannot handle IN transfers of length 0.  
Some of the USB I2C drivers have been fixed to set a flag saying that IN 
transfers of length 0 should not be accepted.  The same thing could be 
done for this driver.

Alan Stern
