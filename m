Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED64332B11F
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934608; cv=none; b=cTUci6PUxSKshPKtlZhrNU9vG4PI0kZ7Gc6Cn9ml8csNBEWJk0K0tI1TgguMqxiqBQlH4ask9WipZ8KkQdEqmkMpAAXIADGjcEZvNaGHFHyWVhNaqxUbgep5mQXvw+xAAT+nx7sxtXYHFBJMnl7aFh2JsakupgIvsxzjiwHl4q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934608; c=relaxed/simple;
	bh=Cyek4Y9nLNSRkAafvnaw5l9vwh6+9aTHSx9kY0gB1rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsG8zb9rAW4u+ZUDE2OWloX15jVCLWNE9ViDCeiBBWrXF5neG1G/wM7JyB5wj+ApzzMrXF+AQIV5f7ut2TP+PTqhKotL/KwlzDCpEqBo3KeiSkyzfC23Cg0hN1zXkrJh0xidSL6VbmY68bNa111o2n9vl4pJrFBVS6yp+9sdUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lzXxOeca; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lzXxOeca"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6c25b040555so4153863137.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780934606; x=1781539406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WgLhkbjkljj/6fze7DqAFJtN42dXUg4ZexL3bcFRx0=;
        b=lzXxOecaLLHdWis+Av1Yk7eJQQqEAxy59yqmCU1ymRPWwQf9m7+DemOWiIK3hD2SsQ
         HqlaWV15MI+t8yoP+gvTaQWgi0y2hvDNgY3Rihc3seA9Zcb0Y7F3MebSPFIuNE55otyk
         NQYg+7diPob37aDh9DO9KDS9fwezvdwGEdGo3A+JuXWtj/FaMGUHdEmdNgOawa1Hw4tn
         kQPNv0Onwe2SVi+OS52Ieq11G8k3fiutA2gkZYHCSApQHqC5AR5TWOUNVUOksGSOTsgT
         ZhSQ3ExA7ltHTkPpg2IqYsRgdSwYi6wYy91Cc4+dQA0SS1fRUKQqJhxOILaFPosNGwBq
         onSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780934606; x=1781539406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WgLhkbjkljj/6fze7DqAFJtN42dXUg4ZexL3bcFRx0=;
        b=P8Mor6MNh+xXPngNZlb3TWW+IwTYeCQdOkDBrv8JIDYeYykEvPk9wGROD43ZeaHxYS
         IB7QpBSMVSFztEILCPdDSztDLfiUfZDjP3e3ARj+k+TV/Ph652oHQylhojNuCVzCAw6N
         W8cev6h1TZj9NN2JyoVRhybCMyeLSiAcBHbHQII/PhkDUP/IHDAeOCAQfsSIRq11t8B1
         D4nFLVLQrQHQRsoew6Qyru2Rb2fioUA9eiB2ujqdTCsoCObqkUCa3G4QsylgLu1QKAnY
         98NeENFewnxbxRYmaqFQoBr8SZCpHw7OrDa9jLcsuTMKrtds/PCXFWbiFx58PBigUbat
         BnIw==
X-Forwarded-Encrypted: i=1; AFNElJ8vTtvlqX96nCNs7FbqMlL6dmiykYAJr3nDWVDArbgjghizy9xJtW+/KQfkbXt5Z+Km3o+e4c3nm9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrV0aP4GPf1LWUguKIvaI82KADwqbsjKkscNFRSQl8ZQgbs9bd
	kcK4YhqmUYyR/Ln2wEXEe4Mo2wCO/5q7aY8LqzT0bfGnG2n699L39Qg3lHjmZfwgGQ==
X-Gm-Gg: Acq92OEFEGnuLmCVOxejCus762m6L790y5hHRVyYHOaCRf6+my+MVUlAng4gur0duvB
	dn0xIOctacCr50+5g8Rj78Tb/+OLUZ8LRfYDL3RZ9QwKku5eZREw/JhVjtJ66+w6yztPnJIW/1s
	CHRT2pS59JMO2+qjlUuv7u2gDCGtarSnY8yQzEUzJ0DVR9IQlAWUDl4TKQoulSynbJnOQ7RbltZ
	cI2Wwa4rDNk9+YKAL0iK+slLo2AEmggZJl9q4yP19diBhpm8ZMJs5uS2nySRUWpTQ6HvDHLcneo
	NlT/eKkkQ9Vllpez6Trmq8R1OczyNt9btYn1/Zan9+KNrAQAV/aJ2b2J36X96rqmEAD+SuQjMV7
	X7Ft0twSQLvWK09lCLuUOqMCnhYvYWXJ0P5jeUYmUalbMI3Ytc7do2jsCepebSr3JbjyFgHiNFw
	bIEM0bJqAe5aJAzOTspqY30RkVMt0UQHI9adxVf73FPZJ7mbPzfOw0Iw==
X-Received: by 2002:a05:6102:548c:b0:631:2624:e5ec with SMTP id ada2fe7eead31-6fef90c7235mr8153393137.16.1780934605751;
        Mon, 08 Jun 2026 09:03:25 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a009fe7sm1761825485a.8.2026.06.08.09.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:03:25 -0700 (PDT)
Date: Mon, 8 Jun 2026 12:03:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johan Hovold <johan@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Shuangpeng <shuangpeng.kernel@gmail.com>, keithp@keithp.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
Message-ID: <0085d585-c3e8-455f-9959-b019800f08ea@rowland.harvard.edu>
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
 <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
 <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>
 <67613cb1-acaa-4870-93ed-95a282a74f06@rowland.harvard.edu>
 <aibbn1858ZUIq6Fq@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibbn1858ZUIq6Fq@hovoldconsulting.com>

On Mon, Jun 08, 2026 at 05:11:27PM +0200, Johan Hovold wrote:
> On Mon, Jun 08, 2026 at 09:29:23AM -0400, Alan Stern wrote:
> 
> > You're partly right.  Both my original patch and yours ignored the fact 
> > that the driver takes a reference to the interface structure.  That 
> > reference isn't dropped until chaoskey_free() runs, so the only 
> > debugging statements that need to be removed are the ones following 
> > calls to chaoskey_free().
> 
> > Index: usb-devel/drivers/usb/misc/chaoskey.c
> > ===================================================================
> > --- usb-devel.orig/drivers/usb/misc/chaoskey.c
> > +++ usb-devel/drivers/usb/misc/chaoskey.c
> > @@ -248,7 +248,6 @@ static void chaoskey_disconnect(struct u
> >  		mutex_unlock(&dev->lock);
> >  
> >  	mutex_unlock(&chaoskey_list_lock);
> > -	usb_dbg(interface, "disconnect done");
> 
> There is no need to remove this one as driver core holds a reference to
> the interface until after disconnect() returns.

Yes, you're right of course.  And I'm annoyed, because I had realized 
exactly the same thing before noticing the usb_get_intf() and 
usb_put_intf() calls, and then forgot about it when updating the patch!

The final version of the patch is below.

Alan Stern


Index: usb-devel/drivers/usb/misc/chaoskey.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/chaoskey.c
+++ usb-devel/drivers/usb/misc/chaoskey.c
@@ -320,7 +320,6 @@ bail:
 	mutex_unlock(&dev->lock);
 destruction:
 	mutex_unlock(&chaoskey_list_lock);
-	usb_dbg(interface, "release success");
 	return rv;
 }
 
