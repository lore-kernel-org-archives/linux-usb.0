Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F2233923
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787034785; cv=none; b=c/iO3ln5RBnYszXCOckVjE41vYepwaL4RlPUj4OvkusisXiB17KEsjiBXS3DAK+51gPXz8bqhLyCNkIOkySEsPQ8M4zZ+gXApl8/Lf411jX4VE9kQ6x9kcgR7pN3EMuYX0eFSlV79Jz+RjJArLsKu9VDKGjWuvixxMOLrVPipao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787034785; c=relaxed/simple;
	bh=KvLBsPIZiQIoOtzd3m7MbdZLgvgTdxMJVb0p4mDTKhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b78yJrudh0mXOgilKS8QNQU3Cg+23Nvywes0e+ErU49O9S70XIAHDgFoF8+qy9RsWSYwOPg38FvQ5RNIiyIRGSjRkFLcg40TiYoilzo/Bn86SbyOH8z48RgMG8hNcf+UVyYTbJHfPy0X90ZoYpFs8nlwvZqExg3NE6HxSu7r624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=p3Xeyj7c; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="p3Xeyj7c"
DKIM-Signature: a=rsa-sha256; b=p3Xeyj7cDM0odOv3QI29+4k1mQ/Nqj6OhP9DhouACyRdubzR6WO18VzYGnktwxaeSAPMpQPy7fUncUXuVIHQXsJ/ZCYO2zAwU/r9S7JtRAjm9+suF+lTeMCZwStIppf91gSshq/JMPT3JvE/VTv1pBmM0M3fVy8gWhZRVWzun46z+yuv66bQNEYM8A7omJqTnb0wSilbXZ9szjybuNBp3fj+Wjvf2hzFKEKjC1QUEEJN4wnfmuklrYl0n2b0a5VmqhGSVqndgvQy+wuWIOo3bsmoayChD3FbjFpN0nn9S/+V1a7nP5Jj+H+LvhAWHzWZO2lU7Ihv2+xlC/v27qdTxw==; s=purelymail3; d=purelymail.com; v=1; bh=KvLBsPIZiQIoOtzd3m7MbdZLgvgTdxMJVb0p4mDTKhI=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1185890304;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 18 Aug 2026 06:32:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1wwDNC-00000003OLa-3ZLi;
	Tue, 18 Aug 2026 08:32:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  David Laight
 <david.laight.linux@gmail.com>,  Michael Zimmermann
 <sigmaepsilon92@gmail.com>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>,  John Keeping
 <jkeeping@inmusicbrands.com>,  William Wu <william.wu@rock-chips.com>,
  Marco Crivellari <marco.crivellari@suse.com>,  Ethan Tidmore
 <ethantidmore06@gmail.com>,  Kees Cook <kees@kernel.org>,  Chris Wulff
 <Chris.Wulff@biamp.com>,  David Sands <david.sands@biamp.com>,
  linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: drop ERROR() on copy_from_user()
 failure
In-Reply-To: <20260818012118.3903388-1-gonglinkai@kylinos.cn> (Linkai Gong's
	message of "Tue, 18 Aug 2026 09:21:18 +0800")
References: <20260817154604.70427ed1@pumpkin>
	<20260818012118.3903388-1-gonglinkai@kylinos.cn>
Date: Tue, 18 Aug 2026 08:32:34 +0200
Message-ID: <877bloym4d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Linkai" == Linkai Gong <gonglinkai@kylinos.cn> writes:

 > A failed copy_from_user() is a userspace error and should not spam the
 > kernel log. Just free the temporary entry and return.

 > Suggested-by: David Laight <david.laight.linux@gmail.com>
 > Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

> ---
 >  drivers/usb/gadget/function/f_hid.c | 1 -
 >  1 file changed, 1 deletion(-)

 > diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
 > index 3c6b43d06a6d..5c39da1ac7a6 100644
 > --- a/drivers/usb/gadget/function/f_hid.c
 > +++ b/drivers/usb/gadget/function/f_hid.c
 > @@ -656,7 +656,6 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 
 >  	if (copy_from_user(&entry->report_data, buffer,
 >  				sizeof(struct usb_hidg_report))) {
 > -		ERROR(cdev, "copy_from_user error\n");
 >  		kfree(entry);
 >  		return -EINVAL;
 >  	}
 > -- 

 > 2.25.1


-- 
Bye, Peter Korsgaard
