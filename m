Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1233B53C3DE
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918714; cv=none; b=a0oj7tXLx6ML4/EuR0NNtIGrTNQ5WsnCPPiDy9mQbK8Qa5UHaWjcCg5QTZeOMuJf+HUr+gHiPRTNAqCvym54AJmYjaLGa44jE0PI1oPTi/n/jhyPF0vJGRWwwSu3boA2a3MJSkd2WDNPO8lcIyVPGW6GGmTJsVACGuJpOosPY5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918714; c=relaxed/simple;
	bh=3HuQAdiPdsh0jwsZb5sHsgSWrdEkCX/qTBEkBhJKRIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrHr+QYom4m0U4YKscjAzgEkLSb0unaX/705Y5Fw+QYk78NAIydywhvlcoLi3Xj2B4eP2bk+CH1i2D49ryJgC67TIzgjhSwjw9eRnsi8swoGZDIwGyjzJ0OT/IfS8IZZO+rYwOfQL4Ba7Jy/epz/wSV7007T6Z+LMfQfckaglOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jYB5HlbR; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jYB5HlbR"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53582498790so40431921cf.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791918710; x=1792523510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EUvFEr9KZQAlEL8z8vQRJTx2wZ9st4nMmUN/wIzO9UQ=;
        b=jYB5HlbRG5U/2bWjeQZ0e1BIVUMFP+thLqGog9vaQfAEiKHAPsF198vD52pAlmjbu3
         wzhTppJOCWuUFd6tzpAxIpKlGqshaJ3Ap8ACpWD9T0UbdCfbIEmkUMO6h7yX/0dB+45L
         nbirKPSHlsE7kepk2T70UlSzu17r5edw7hmV3/DlCvvRPMmHH+aURwXGw1Exgz8eVujJ
         NQKVFkwMXILXElBEKaYr0VU8uYpIcMFQU6T5kdutbaH3VI1X55DyFvzLuS5UdkAR/uuW
         0jGQvTFiBCwlNc4U3yhH/kmtaO4lctSTz3+EhBP9Ah/xhUT9cV/+OuAdw/G4HZd375QO
         CviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918710; x=1792523510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUvFEr9KZQAlEL8z8vQRJTx2wZ9st4nMmUN/wIzO9UQ=;
        b=sku74f3DYIQUIr9l/j7IPOn2m2ZhaHUYFncOstj/2G0pP5r6EL366g5g/gTirSJRbG
         WOyJymQJ0/nTh9LwL8xzuOqsTKqTJj4kmy4sNghoSezJgrcGXRqLQVAUSPVzMjFFC0ak
         ABXYTgQetkJKK4DrxRMdBZ26ajugdLnVNvr8703y1NWEBMXkDfxZPsDUUSsSAJP3RpvL
         z24LmmYtLiU+23MvINgHORgFyPHyAE8O0QwJ8RrjLY/U3HvVcWgrzok+fxpMxC8egZz0
         0Kp/UkjMYtTijlO9KVXFbSjqXYcpAY/J3R7ozzRSjpT2cz9SSY0MYzG1A/xktArgxrmh
         viqA==
X-Forwarded-Encrypted: i=1; AKwUvBxWnQbyBGahYWNFlTrnWHHRzIKoTVWllZkqq7YaShma9mgtHH8M3M/ioFZ4+R3IxJMJdNAI3CBJIsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwQISHyptHS1Wkbc1s9moKudx3vDgOZbr5svGnFZfYZUetQi02
	+PiCiy1q9mhP1I1DFBMnCv6qS6Bj794su6gWs0gK7HdBnH7rvLOU30agDPNiEtE1nA==
X-Gm-Gg: AYBFou3982rPbK3ZM00Zo/Kvs+tSoIKbb0bovIg1Ca1lAom8RLz16PafrKuNRfIKp1K
	QW/kaI7tREGe/Pv2YtwrlXs/0IXZYhOjjKRXkGXfhr/a6KBBN5I4HKa4QdeJxbEUvXNodp7wuS7
	i6ZUjxo7rkl3fnEIi3S3ZL47qnhkLH/6t0rieRB2PA5u1syGOlR6fELi+piywrTfe5L9iH/y5BO
	ZMWNwxOmj+2BWvxegqs6qlBosvnYKbazN6/2Dr0rhTVpkqeCcYnBnNa80INWNGy1w2rJiM8n+Hu
	d2alX5D3WuUmJEfdD6yRHtGmTn6XUrSRRQM1jeMnJ1YQwuwDDejQSM4a8eMAa7yH9jD9eQwy+oq
	mnBXMNkFR9wF/y/2XRkklumY4PoKchCUpfwxncVIFsNItAahNz0dbR1S0NiwgwPtWBsVmVYYmix
	zz0Mb20wdQabhiphV4bBMI/SxFtKAyk5Qv12CiDzg3kGEAMjoAIs5EE1bjP0LKmk79hZx8AwYux
	MaRmJgO2MhFwnBZ4pKJNHP8SQPUKiQxVFiwDA/kgg==
X-Received: by 2002:a05:622a:48e:b0:535:a5fb:67fa with SMTP id d75a77b69052e-535a5fb84aamr206754931cf.70.1791918710428;
        Tue, 13 Oct 2026 12:11:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ad30csm109382571cf.23.2026.10.13.12.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:11:49 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:11:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] driver core: take parent lock on deferred probe
Message-ID: <ba24846a-7403-4bb1-a0cb-869cf1d44e05@rowland.harvard.edu>
References: <20261013140615.1226992-1-johan@kernel.org>
 <DM3WA69YX6WE.2Q4DY9MIU7A0L@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3WA69YX6WE.2Q4DY9MIU7A0L@kernel.org>

On Tue, Oct 13, 2026 at 07:43:08PM +0200, Danilo Krummrich wrote:
> On Tue Oct 13, 2026 at 4:06 PM CEST, Johan Hovold wrote:
> > +void bus_probe_device_deferred(struct device *dev)
> > +{
> > +	if (dev->parent && dev->bus->need_parent_lock)
> > +		device_lock(dev->parent);
> 
> This looks like it has the same potential UAF as the other patch.  It's quite
> unfortunate we need the whole need_parent_lock thing just for USB.  IIUC the
> main reason USB needs this is because interface devices share resources of USB
> devices and we need to keep the locking order to avoid inversions, right?  Is
> there more to this from the USB side of things?

That's pretty much it.

> I think we can probably do something like this
> 
> 	struct device *parent = NULL;
> 
> 	scoped_guard(device, dev) {
> 		if (dev->p->dead)
> 			return;
> 	
> 		if (dev->bus->need_parent_lock)
> 			parent = get_device(dev->parent);
> 	}
> 
> to avoid the problem, but it's still a bit ugly.
> 
> > +	__bus_probe_device(dev);
> > +	if (dev->parent && dev->bus->need_parent_lock)
> > +		device_unlock(dev->parent);
> > +}

Wouldn't it be simpler just to make each USB interface take a reference 
to its parent device?  And likewise for USB devices, if needed?

Alan Stern
