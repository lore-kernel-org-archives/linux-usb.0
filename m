Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F423DC4AE
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548605; cv=none; b=RJPVn3EkbNZBl/jAmfQGx71ISArOKmc1yUFUaH5umVmDBg6/ExDGR3kDTqv9EIJnmEu/sbLaZAWNZURfgKAGewd1pj12xg7g7YG3qeMhBvBM29AntpWPS0CKPJ0Qo/Y+EODF0jLBcOBhXBDXZ8KVnhOAlLhxdzxdOT6LfpOzzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548605; c=relaxed/simple;
	bh=rInrtzpARM02s19QSOtE6OkBhG49q2hI3ZM84Iigdqs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPh57ty+aGIBBJVeH9fpLmC/fKZF1zg9KbMTbZW2aAtN4tjxFVFkAffms52qnSWDIyqQY8JqZiWNkwqlVSXr6oQ84SzUzcs7ld6HFZqqegU5l3PZwXKN4I8oVDMROc80UbLdYi8ndL5xsQXsxmLuNFm4yGuHkp+T0I164H7d844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxnpAeZW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxnpAeZW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c399641so39974495e9.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548600; x=1792153400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ms0qvO2Bde/W3/r+8wn73N2nwi0yF3AELxxo5LlqYYM=;
        b=GxnpAeZWFE/c4QXkI3P89DIcVYsabfr1mrw4yHwI5Gwihzt8/GmFuPLlh3/ulmGCch
         fI8u8em3BG0lSXp4c7c4gWmNpUQAYEY8QtDMdsBOpc5TRU2mq6CeA7XbhtNlBA0WIuAx
         2mW/zcD+xk404nryvPiKZcldOVNOV6JnduTwTDq3BVzp6r7z6vvOqsgo9RbvTfoSy2RZ
         T2EPcw3yI3TRM6+oMWATqB8WrF6vkAi7IiwEDc7MjOlIYSmEubfyoZbl08ir8q/sl103
         c6K7rwcWgITMtttxvzYNEc2EBdysTnhmYghOdyyxfhj5r2ndR0c4vMiXlGB8UtzC8ZC2
         Vj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548600; x=1792153400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ms0qvO2Bde/W3/r+8wn73N2nwi0yF3AELxxo5LlqYYM=;
        b=07lMwiEmKpCF/i6I2rAOctwMyHJqsd3BwL9KGCzRsOovCv899xnEOcndVdBkN50fbf
         OgUhvQhLR7MnqfAzA3Ze2EOTgERBdZ241QIjpqHQQXqq8iD2BgreO1Kyjkp986zWpP9S
         IT/RWuTBzmc0mrEF7RMKNUfp6ZxdTYpJmkk990NB//l/LHwLYWlsN0qjcpzV0JcYn4Wd
         qGi5m9aelN1PeuWYAP7SfrUabmQw3bPqOSaZCw2RjKRHuLcIcBoGybvhxXjE7LuvpKit
         tKb+ZXqCJiu9x+ObcnPVwUKYj/bP7c1dUx/36OD64sx/Qci4PrvlJTm4KOKTKQXa/t1I
         imSA==
X-Forwarded-Encrypted: i=1; AKwUvBygKlgY3PKTgGh29+IgEmegq5T8Kef9ZcOEX/tMLESLqjFbIgyGuhRii+/qzGSWZ3XWF1JxppAEWlI=@vger.kernel.org
X-Gm-Message-State: AFuF++luanVTgBfIu/OzwGhR3y4pBZHn4FRoIDwuTkClVFJuIrAgHo7v
	U08j7obBoUwTEoU3ghLskHIBI17UpWJdmjcMZZGeHZxCK+sYbwXg8OsPQwVQNzab
X-Gm-Gg: AYBFou0mVf4CX47AQiCo1PmljTRn4UhuXedXEu1Z3+NuGyxZnINTHt4j0UEFfYazdBe
	G9JxNzfwnAUkA7fv0o84O8TfPdfXujWDgM6BPdfBNN5rOw4ZBwSyPlj2i5/BffgKb77O5UYQOoO
	Qhydf4BxGLtaP5aogUY5tMf8dmIze1QpIunM0vvkj2kBPVPHTJO8ECjEWJOXnRcP3C8Gfo83LGF
	Emrq0fhbddc8Db7FK63QIyX9lYXWsifAM6JfEYx4kngtG/OSYYs++Q+ZoazOtNpryX2+2ZK0Ush
	MtovEfXQgJwxwpnFwDe0BxNZf+0gPqF51zmfuTya8fWUkwdD0lxeVxcEZsdcvY/x2QJz02glk9T
	N4zeTJ4g+FT3mSHH8uuI+A+f024SzIDsJY8R6eqbi8VtS3yhX4rgXkPOysg3a8zNxGezSkLWASw
	qKMa/WjHnLRf4lPqlOv80RZGgcqd/wsiO5BRj9CQb0LrxIeXBHF3HDNiS4G2F5+IDR56KBXZpQO
	xPL69T22sFZr1TS3ZO6
X-Received: by 2002:a05:600c:46cf:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a18e47ad5fmr35427825e9.10.1791548599630;
        Fri, 09 Oct 2026 05:23:19 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm49225305e9.5.2026.10.09.05.23.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Oct 2026 05:23:19 -0700 (PDT)
Date: Fri, 9 Oct 2026 14:23:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/14] xhci features and fixes for usb-next
Message-ID: <20261009142311.02159176.michal.pecio@gmail.com>
In-Reply-To: <b07fb226-d2df-4fe8-9a09-dccd61375ca0@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
	<2026100935-recreate-finer-714b@gregkh>
	<b07fb226-d2df-4fe8-9a09-dccd61375ca0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Oct 2026 14:00:21 +0300, Mathias Nyman wrote:
> On 10/9/26 13:50, Greg KH wrote:
> > On Fri, Oct 09, 2026 at 12:58:20PM +0300, Mathias Nyman wrote:  
> >> Hi Greg
> >>
> >> xhci improvements and non-urgent fixes for usb-next.
> >>
> >> One series by Michal to improve transfer event handling, otherwise
> >> smaller scattered patches for dbc, early dbc, sideband and generic
> >> xhci cleanups.  
> > 
> > You you want me to take all the ones here that were "clean" from the
> > sashiko review, and ignore the ones that were not, or do you want me to
> > take them all now and those issues (if they are real, at least one I
> > noticed is not), will be worried about later?
> >   
> 
> Let me take a closer look, I'll send a new series today.
> 
> Some could be dropped, cleanup up, and submitted later, like [PATCH 1/14]
> 
> Others like [PATCH 10/14] is mid series, and don't want to blindly drop it
> without checking if sashiko issue is valid

Oh cool, more AI slop on linux-usb.

I don't like wasting time on that, but I understand this bot has just
been deployed and it's two weeks to merge window, so...

 [PATCH 13/14] usb: xhci: Fix bounce buffer overflow

Yes, -EPOROTO or -EOVERFLOW is roughly what one can expect when the
host and device are set up for different packet size. The patch only
tries to ensure that we don't also get memory corruption then.

We could actually try to support 1024 byte bulk high-speed endpoints
(provided that the HC doesn't reject or mishandle them), I tested this
on FX2 with appropriate FW and mentioned such possibility to Mathias,
but in absence of genuine user demand he showed no enthusiasm.

 [PATCH 10/14] usb: xhci: Don't set the skip flag on non-isoc endpoints

This is a pre-existing (non-)issue actually introduced by bfa845994282
last year. I see Mathias has just responded that this is limited to
out-of-spec host controllers which, may I add, aren't known to exist,
though other forms of bogus or mangled transfer events are known.

The code, again, only tries to prevent completely crazy things like
giving back multiple pending URBs with zero reason to believe that the
hardware will not attempt to DMA them in a moment.

Regards,
Michal
