Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D333CE9A
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764333; cv=none; b=cq/WlU8kpE+RLxB9LwNphyi3a4XvUfsk/8HwDBCIxPwFAvX4j68eBv/QKFKadoEFP2+ZGAtkhnvY5fi5W5fNSJVuHRhFzUnhqeCurVJqAtzlWA+/ztCIBHjBMvOBjKD3bexg1mB2QZ1WtYEQnJLJppv+XqpMpDNaIyV2zS0qPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764333; c=relaxed/simple;
	bh=N6/TLQ1HoeM8ofTu47a3geK7G4lEGYpy0LMbn84BFvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrYDT4AUfBefTyoIAblUDSZNt6Xnd+N5jYD6OXD5N4AULJ4WUpoIJMCe7Ms8a2BSziCd6i5MhrzrzK5t85uYKwy4mZCpHIiSXqLeZktTdqovJlVttEqScNclcgdzKO+xihqe+hCXO6uJFbRCwWnffBfBBke4CMlbOAZNa27QC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZQ1CjBO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZQ1CjBO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so835949f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783764330; x=1784369130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XflGHAc1Xp5hzTl6nbzqaL3nI864At8Pkh3JKKoByd4=;
        b=DZQ1CjBOPOxqZmk6f5RqvlNLBRRAxR3PFdF4AH5VNMP/rHzlmbfs18n/L/rnu9PJ/M
         jGAWsc/F+KdjEzsDHETDJiE8WWlVeIaOa3HXxA1TqxWqbLjDg1/wM+Bcw5p9ZTmG0H2v
         +/HaN/zRFL9GudZLQbpOanffLyxkL9vO5POM1JFKI499Dc6V3KazQKu+5ATZ//ZfRaPQ
         ZKKY6UGA7qnEca/0pP7wrdv6TtUaVoClXmMuw2RbqJvKCLxSHgmaEqrO4JaJqrl8qdkg
         TzKbUbl8TKrK5M2OivOlW9HKJ0RxQFIuJep4vcKD/hX6xoCLQBGVuRC4EP/O0L+QqvvI
         5ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783764330; x=1784369130;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XflGHAc1Xp5hzTl6nbzqaL3nI864At8Pkh3JKKoByd4=;
        b=UzykoQ8rpNrAeGngfBjvFCIiOJoeVIf9lQvjW0NwjviSqZ1/EOniCvNXoy/kcTwQSB
         m3OEBjLfCSW+M2eEkDm9aBl58Ur0P5QV6thdEZX9uGF3ypYc8pJx2JpAT1UjB41Nk1YI
         /HTN4F2W+YMhR0rTeUNI1eXwGcigi0xZtU34RGOGn8szkHrTPZuh4/2axwXF6T/U9Nx4
         ug3NAa4vHMeUwfR5bj9pFlei7lZRnWTlogmA/Q0tDMRezlAfiSfKDLXL7xkJhVn8lOSn
         t4NfaoPZMz8nn7R9ROXVGJi9XfOvY2RpZGyViyAvwvx1LOLoQORe953uj25qPOPcx79x
         Ke0w==
X-Forwarded-Encrypted: i=1; AHgh+RoGZ5povHxQHLuQl+iO2LFf/ZOr4pGsQyChSNz49CIym9SNB6bQ36y6lcdp4x6BwdnXlfmWtuu/X9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXyEDnUqsf1NV+d2/bcFRSRDwDTnvYOzaWNq5hK529/1F9+Jo
	Nr5d5l1qSEJos7tNH5j8DPixB07FLsKmu6ZKbwGbXB+FrP12OSmKZ/7i
X-Gm-Gg: AfdE7cmBqZEsetNUHCoywTaGc6tQ03v4G5xTEt1Hyhw2USlbXhHHUD6T7hej9dJd+rD
	ni+NUuM8xeBqseRp1ZgJb5QJvhuXoIU/0xiY43C/IDHh1hx7g/thXxKrU+bUGh1OlAMN/GCx7aj
	wAxYKysadUWBRKB/TKlvX2YntvKqJJkdYfZ6FBsNIW0VIo63oX2ATF2zUkTHNrtEWBp1zmJCtyl
	/6X9rXRM2OijueYA21Pdg5TcZtHP1TKKg3/62teynltAMPoJ0cHccdYpX0WTB8O3GAmrUZGO+mc
	3CPQ68zy4SDsf7eis8GsQnBJtK8lVm+KJo8AGs1B4LOyCgPeu2kn7XbUEX9cDgCnlNwBiGtXgWV
	CW/Z+uDkdmWssUoeRKu0Hn4xF9zpSq/quZ8Mh+AKQcSmV+8+OSm5ttLMQyVQFN2e/TtlQZSpL+A
	wTex71G0l9KhVSAHVWpAPqqA==
X-Received: by 2002:a5d:5887:0:b0:47d:ed75:1f9e with SMTP id ffacd0b85a97d-47f2dcd7e25mr2288299f8f.28.1783764329874;
        Sat, 11 Jul 2026 03:05:29 -0700 (PDT)
Received: from foxbook (bfd46.neoplus.adsl.tpnet.pl. [83.28.41.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm67804646f8f.11.2026.07.11.03.05.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 11 Jul 2026 03:05:29 -0700 (PDT)
Date: Sat, 11 Jul 2026 12:05:25 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Xu Rao <raoxu@uniontech.com>, mathias.nyman@linux.intel.com,
 niklas.neronin@linux.intel.com, stern@rowland.harvard.edu,
 ukaszb@chromium.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: sideband: fix ring sg table pages leak
Message-ID: <20260711120525.0afec034.michal.pecio@gmail.com>
In-Reply-To: <2026071028-sacrament-paradox-ea01@gregkh>
References: <53B0BFAB966BDF11+20260602034327.2780520-1-raoxu@uniontech.com>
	<2026071028-sacrament-paradox-ea01@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jul 2026 15:51:17 +0200, Greg KH wrote:
> On Tue, Jun 02, 2026 at 11:43:27AM +0800, Xu Rao wrote:
> > xhci_ring_to_sgtable() allocates a temporary pages array and
> > uses it to build the returned sg_table with
> > sg_alloc_table_from_pages().
> > 
> > The error paths free the pages array, but the success path
> > returns the sg_table without freeing it. This leaks the temporary
> > array every time a sideband client gets an endpoint or event ring
> > buffer.
> > 
> > Free the pages array after sg_alloc_table_from_pages() succeeds.
> > The returned sg_table has its own scatterlist entries and does not
> > depend on the temporary array after construction.
> > 
> > Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
> > 
> > Signed-off-by: Xu Rao <raoxu@uniontech.com>
> > ---
> >  drivers/usb/host/xhci-sideband.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> > index 23153e136d4b..a5deeee4d5dc 100644
> > --- a/drivers/usb/host/xhci-sideband.c
> > +++ b/drivers/usb/host/xhci-sideband.c
> > @@ -58,6 +58,8 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
> >  	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
> >  		goto err;
> > 
> > +	kvfree(pages);  
> 
> This looks very odd, how was this tested?  If
> sg_alloc_table_from_pages() succeeds, then the table has the pages in
> it, you don't want to free them again, right?

This functions copies pointers to long-lived allocations from private
driver data structures into a standard sg_table.

'pages' is an array temporarily holding references to ring segments,
under the optimistic assumption that segments are exactly page sized.
If they aren't, the returned sg_table is wrong, and if page size > 4K
then 'pages' is allocated too short and used out of bounds.

AFAIU, sg_alloc_table_from_pages() converts those page pointers into
addresses stored in scatterlist nodes, so freeing 'pages' is right.
But see above, the whole implementation is questionable.

> And if this is such a major bug, why hasn't anyone noticed the leak
> yet?

The leak is a few bytes per offloaded device.
