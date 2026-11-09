Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256485;
	b=OaaVWdoM62QTbQWcrTkw5fjvtKxPuMD7wX/Fv1BjJSX6enyyAr27TBWA57XAKTjmMlD4
	 0w96ldFalOCq8whClalMJeq7uwQgKCVO5cQBeEwElzTTTj5GAjPQSOeelHWkRxyP+saEg
	 aGABG5FeVjpQY9mlEphzZZn08Qi+Z6W8aj6jFptlDqIZ5KhY2tLMKNG1BTH8JRf1Zrzal
	 ZxkxrFbTfeILV0gzdzKZommyXpATJjCeim9KcgGbKN9xJLh1LbIJO6JddboIO7GwLx3IV
	 RlD4XKgefcxanEPU6+mJJUhC1cRb+8ffGGuB/p9njDBJ5DdluYLkrKaAwju2KHx7//w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IBxWV0bMHBiaBYABre4CeRklD+VEvSYRbNLDT7mR5OE=;
	b=DyJLaEuPHWW3PF7lXbAuIfsfeVNMvLCQOYr1YAFzp/451hqLMQWEj9dnO1LWopl5xLm5
	 PW4mADq4X0x1A1BYhbMQp452Lom7csuFEEMvfVFWhaWUsusVWChz5Ee67R6FWwD176/EP
	 TievCVinsLTN/fgCiemAO78UO3YzQrCualw2NWCkVpjSXiYB7nC8Vep3Su+VasPWguK5T
	 RFoAklBqjAg9owUmBn0pt8slBfKvRYSTA1kqLYWz+f8hN22yeNcPGM52pl3202ccPShyr
	 S8gcFUaoZ2CdRUUhKG/gCMnAeKDrdXmceO59Ky3rzvVZk9ftOW4aKr0NAK6MhDWoSuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9TmK+9W;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5DF606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 20:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5DF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9TmK+9W
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so1063131f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 12:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794256483; x=1794861283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IBxWV0bMHBiaBYABre4CeRklD+VEvSYRbNLDT7mR5OE=;
        b=c9TmK+9WzrGyvd+dKsPN5CRanNi3KrAxYt7LKAN24BULUbEELTKz9a3REq0gnaF1eU
         96dkvLHUhT+Dey24BA803kWLvqWppZfKGlgK/KTSDJWb8BEvoi7SQKLyu0+qFBBTQre6
         c3ApfaIZXvk4P+K3nfi3o4lJT5hPfKjNev4vephwJOukoaCVqawno6zNEU4T8EiQ2QXW
         9yEl7K8t58m72puXrbI19fiGd0WImOk5Oiyyr49pOh9OIc3MUl6WSRXs2+54rV0TOQsK
         Ia7OO0PJANNhk8znn9Z2t/YF+YVTLM0vpswHDvvA4LmBeyZ/HMzX3fo3LpnpsBPzg7u7
         xlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794256483; x=1794861283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBxWV0bMHBiaBYABre4CeRklD+VEvSYRbNLDT7mR5OE=;
        b=gug0WBXQxEn9GNy9H2gxiH+OSJemKQ+qSGoH35rF00wjFO0/XzWQqs+ca3RB5aJv5f
         jkkSVFDYOzyav7qVXlouP6z18ZBnJUCSQc/YpiAfoRcCZulaUulrmV+9o/hMkmOiQFHG
         PcMXu7JFNob6LjuljrDgczCizLsXkdgcwRbTPqwQjTr3s/QIOWopybUsAGiyMkg7tqGi
         pahrg98jBbZb9VpNtFHsnONdpr+uq7QFFwAs14f8ZCtkCCbcD7cy6vXe9qXl0JwZcg0G
         v1LRRjmFqdYf7TEBkXfN2aWysu49h+N1FPjaNjwBNbArBX9R0ImEH7EKxLk0zTbdhKa2
         J4Nw==
X-Forwarded-Encrypted: i=1; AL+hErFA7xzAwhXx7/e8JN7CDot4dZ+QO1PwDApQTBLSa/RrLjASHnr4USXZNMfmlQtjlEFz0yCMOnsEvEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nFPH/glaBXv9pMVwNYFyXjY2rHkrQQCgrhk4UYkbUL6mAtP0l
	5MIyxO5x3nXVnpwHrsFT+M7Mflf06DTkj/1tjuhO5LEz55QJaERQHAae
X-Gm-Gg: AYBFou2S12An2Okyeyx62SvEdx4yQEJ/EJmpbguHChTWL39NKHuQltBuNgbg8d22hlm
	BwLPw3pDCNr2SoMXldbcl3+MvZZSOh3IpTPOKI5mStcN+CX5zEwROXk3d/33Ra75Atl15COcGng
	y5J+qXHuI5cADLkCGeKhsjZyh2cfOpcdID1OQkJd/YXULau6tZCu7BZDPvnvQCyeK8BqHfzMF89
	WewskTfsEgqAYmkjpodW+Du9yfaDWaE491hmjfEHDyeVx/Q8v1ZF24umtQoz/Zr1V/jN7Y7o7V+
	Fwl+/UJk7HOVgQTJOFoHKFzQ1Q8qjM8LZnzD33x2+F9tlcyUX+n7cJMuYZM+qFATp3ujAC6L1yd
	EqK+TbDujGqAbRhFyYt32TsSNRVa9PmtVWZxqz7zc2PIAm++7VMXZu4I5vLzKSNMnbDlRK05K6w
	/F3CmId88V3mVrZlqr3n38R3VP4e2qduCJnI51JDaFFyIFgPBwb3puSIG5yTCgUKvB2YNRbX887
	2QhJg03gqwEkq0wwWvk61FmvS+2B8R7ka3DnXbmaXh46OLX+V9EDLVsnJbKiXbqokAxm2R52hC2
	X/RHirt0/frwDYGaW7Sq/hyK4uC27NsGGxJwmCsUM/eOcaNGrC16wF7Evgg=
X-Received: by 2002:a05:6000:4b10:b0:48e:678d:396e with SMTP id ffacd0b85a97d-4982e362a4emr1059772f8f.9.1794256482703;
        Mon, 09 Nov 2026 12:34:42 -0800 (PST)
Received: from foxbook (bfj76.neoplus.adsl.tpnet.pl. [83.28.47.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbfc6sm917789f8f.41.2026.11.09.12.34.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 09 Nov 2026 12:34:42 -0800 (PST)
Date: Mon, 9 Nov 2026 21:34:37 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, xuhaiyang5@hisilicon.com, xuetao09@huawei.com,
 caiyadong@huawei.com, suzhuangluan@hisilicon.com
Subject: Re: [PATCH v3] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Message-ID: <20261109213437.5c693895.michal.pecio@gmail.com>
In-Reply-To: <3daf18d4-4936-4ed7-8846-b67f1664be13@rowland.harvard.edu>
References: <20261106031625.1824732-1-lvpengfei20@huawei.com>
	<20261109093935.2634235-1-lvpengfei20@huawei.com>
	<3daf18d4-4936-4ed7-8846-b67f1664be13@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 11:05:30 -0500, Alan Stern wrote:
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 199d3f535a89..d86bbba1457c 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -4969,31 +4969,29 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> >  	}
> >  	oldspeed = udev->speed;
> >  
> > -	if (initial) {
> > -		/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> > -		 * it's fixed size except for full speed devices.
> > +	/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> > +	 * it's fixed size except for full speed devices.
> > +	 */
> > +	switch (udev->speed) {
> > +	case USB_SPEED_SUPER_PLUS:
> > +	case USB_SPEED_SUPER:
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> > +		break;
> > +	case USB_SPEED_HIGH:		/* fixed at 64 */
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > +		break;
> > +	case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> > +		/* to determine the ep0 maxpacket size, try to read
> > +		 * the device descriptor to get bMaxPacketSize0 and
> > +		 * then correct our initial guess.
> >  		 */
> > -		switch (udev->speed) {
> > -		case USB_SPEED_SUPER_PLUS:
> > -		case USB_SPEED_SUPER:
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> > -			break;
> > -		case USB_SPEED_HIGH:		/* fixed at 64 */
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > -			break;
> > -		case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> > -			/* to determine the ep0 maxpacket size, try to read
> > -			 * the device descriptor to get bMaxPacketSize0 and
> > -			 * then correct our initial guess.
> > -			 */
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > -			break;
> > -		case USB_SPEED_LOW:		/* fixed at 8 */
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> > -			break;
> > -		default:
> > -			goto fail;
> > -		}
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > +		break;
> > +	case USB_SPEED_LOW:		/* fixed at 8 */
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> > +		break;
> > +	default:
> > +		goto fail;
> >  	}  
> 
> The usb_ep0_reinit() call belongs here, right after 
> udev->ep0.desc.wMaxPacketSize is set.
> 
> >  
> >  	speed = usb_speed_string(udev->speed);
> > @@ -5062,6 +5060,9 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> >  				goto fail;
> >  			}
> >  
> > +			/* Sync the guessed ep0 maxpacket size to hardware if needed */
> > +			usb_ep0_reinit(udev);  
> 
> Not here.  And not inside the retry loop -- ep0_reinit should be
> called only once since the maxpacket value is changed only once.

Sashiko pointed out that xhci-hcd may not perform ep0_reinit() properly
until address_device() or enable_device() is called.

So it's either this kludge, or dependency on an xhci-hcd patch which
didn't exist until today:

https://lore.kernel.org/linux-usb/20261109112846.04bfeb0f.michal.pecio@gmail.com/

Regards,
Michal
