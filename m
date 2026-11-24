Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526488;
	b=H7AeiQcP/qRPksEo64KvF5JF3p9XTNwfsPPVaECwkIglPUkeaxZtS/A3r7YAJBXg8gJ1
	 tihGvbJSJv4iTyatL3g3w0riXmx3zDvcxQHFnX70MV20KoSQJcbHwuV5UIrbS35+1y0qy
	 QCv7INZHY45DWGKPoDxbNUCzCKJ1cQ79V1qDv1htFRhPOYdGY1ZrpaB0y5VEBOjpdALTT
	 L+6lPImkENI8WcwJb+3PjamkNE5HMBkF7la0PgPFF9UHB6YE+GItcWNMgQRc0BMOUGlJB
	 mGJArj+Dw6I0b+xB7s4QhvtLqYJQ7563dJRgmuF6bVH8sxWOBcUASdSXvQe5mgf4mNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d/UbTX7w9C8C4q6IDHL7EUYQeNfUj43LN0srGzDRwwY=;
	b=Gph1FnhnVtMI/GKSL4/IeGY5Ww8tki6uXn/xAJd6ju7pLuSQ6r3pumcOLej+/z7bwCPq
	 S0ReuYhMyk3iCas8kjk0vNLH35UCSAg1G29qV2lHhW9Wx7eFlEOncHQPFRKT27k3HK8i7
	 P97X2gzOAgfrEZ7PleVqDXSu77mbxuI0oo3e1uf0V/GbgouiZ1HcY+WRriTZelQHTUlFa
	 wzVrhavaTfQPJrFITOSkWZFjFYT4WNmvC7WLrVuA3D+NJI8Gj7D5mgK9D03EljiVHeQTE
	 JrGgjZ6vYCb7YYzzTdBBR+9WUvOI783QnQRkyzDT87S7nn0KHgKfhbr2doAT66JkAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvcxKqla;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD70606A322
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 13:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD70606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvcxKqla
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so11833857eec.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 05:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526488; x=1796131288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/UbTX7w9C8C4q6IDHL7EUYQeNfUj43LN0srGzDRwwY=;
        b=XvcxKqlae6rQZb59KPpFV5YLGR70gyFPY48rh1RzIKbEyaErkfTXemu/MDTTzbaQ8o
         Ixwmrb/GH0ErSFy/pErx00T5h6fhw40tDi2OJbPd+cVNdImCNCnMCX4rA89z4fwP2xQB
         34O5HlTVLfJHOTSnqIjia1QXaA+7+eqeqEHAlVK1BTozBY/mvbpzJEqVAB1pNQ4pRrUw
         7eTzTDy23OULQpNDeQjAXZh18RS3ICXm0b9IoVnOkw5cna3B5IPqr5o7cUpi3w5tSF2m
         a8nc2qJv3R+yoM2AW5lxyS17edKvB8uVP6jWW/x1vQOKiAazbKq7n0LXafexG4zfbmid
         s6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526488; x=1796131288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/UbTX7w9C8C4q6IDHL7EUYQeNfUj43LN0srGzDRwwY=;
        b=GecZDNd8kfTGTVazJcZgSCrHS02iGP0XP0V0dw7kpifdbCmEy5tQr804SYGhmhuX/m
         eE3lOoaC6orXMfso+x0GXNl9BPOwdmso27n5BsGnXkmD+UpFnjxVzngSY0ppagevJXM9
         vaZWT6QS0T0ricd3SHQOg9ulsL5xNCSTRugBnT6gkvR22zqGgIHiQ0m+AX2eF0OCGTwG
         CbS+YkmtL5zKj8VNFKIRqs/OA5RAaBi6yKJMoveL6UNtYS+q/tKnM19xBhPYFjKiY6AH
         W7gzPPDHwFoVwTQg5tsZMVp/qOjihFhxSrkWhHAadfaKUbGS+z1mGYYXAL9M/7yI6W/g
         cqEg==
X-Forwarded-Encrypted: i=1; AL+hErFc2IOnp+INLBhs9QGPFZ6yX6e28uQ7C9qUVZ6vhaw83RSWxsVsTNkxeotMyx5+QvGfI/EFMjahN/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z921wIs90zOU+g9vGuDvjl0B8t0OwMttlumaNXqYFqpYz22YOHC
	JFEn/XKb41THpCGEVk0v/2EKDVo4CQn7CrL8uvONGi0fn1pau//Hp+6F
X-Gm-Gg: AZFdTZeda9wQEuuEe1aGGBrPf15wcW3Dznd6ZaSKPlpHQSNVz5ax/uUDgpU9oS9Cg38
	8eCJ1k4A5IScZzAeV1acTN5vITUyEUwnotRaA3HFdaG59K7MfjHTXMYf1SpVyOiIgnH0D/SVfSf
	2axB4BxlkDVVp5FsqH4uJTkIR5XvbW5p/RD71GDX4Mxld8dE5oQ63mhrwC16gwTZ9H2TClhEIbU
	7iCaeLY1f54xFp/8LH5e/ELb8IbsM9nxgmE1y1F44dC0U5o9cM6VWJLl+2K1VXrubtd3loI0AYO
	WCvMsDo1uHXFwG7xwqTSmcB1zoUSBUCRSjtelTtjMIcXmlpGdc2mWWxyw30wo+PO0vumG1miTjU
	mFpeeaO52v6UyLr/Qik1h1IKKnB38XOOmR3eztvi/UTzNzmbmDizrOCnObkVz/aWT4uUsTrTFJi
	25LSmhtq627552SGBHlD/GaDHzIeaeqo5EH+PcXYHBz/+lOB9qVumUmHDb8IYVpiHouLKMg+J0Z
	JutdDT10aIsuZElEfw+l2LPUylY83iqa1eSZ6/xY72kn6mX3kG1uIwMikuGkP3AlwfjLWRBhlAL
	pqvngpo9Z9UrfMl/KolWm1vmB7srdqzQwg==
X-Received: by 2002:a05:7301:c016:b0:386:5adb:ac01 with SMTP id 5a478bee46e88-3865adbb1aemr14694694eec.24.1795526487360;
        Tue, 24 Nov 2026 05:21:27 -0800 (PST)
Received: from user ([2405:201:c052:b00b:9fbc:e0b0:e020:ae3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm47392736eec.28.2026.11.24.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:21:26 -0800 (PST)
Date: Tue, 24 Nov 2026 18:50:57 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: michael.christie@oracle.com, nab@linux-iscsi.org, mkp@kernel.org,
	leitao@debian.org, skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_tcm: avoid NULL dereference in
 usbg_make_tpg()
Message-ID: <awWPORzewOifCGde@user>
References: <20260915080523.15979-1-pavankumaryalagada@gmail.com>
 <2026112001-emptiness-rewrap-28ef@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026112001-emptiness-rewrap-28ef@gregkh>

On Fri, Nov 20, 2026 at 11:59:11AM +0100, Greg KH wrote:
> On Tue, Sep 15, 2026 at 01:35:23PM +0530, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > usbg_make_tpg() can race with creation of USB gadget function
> > instance. tcm_alloc_inst() adds the function instance to
> > tpg_instances before configfs links the item to its parent group.
> > 
> > As a result, usbg_make_tpg() can find the instance while its
> > ci_group is still NULL. Passing this item to
> > configfs_depend_item_unlocked() then causes a NULL pointer
> > dereference.
> > 
> > Verify that ci_group is set before calling configfs_depend_item_unlocked()
> > and fail TPG creation if the item has not been linked yet.
> > 
> > keep this validation in f_tcm instead of changing the configfs API to
> > accept unlinked items.
> > 
> > Reported-by: syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=a9efa71b884a23e74153
> > Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> > Changes in v2:
> >  - Move the NULL check from configfs to f_tcm.
> >  - Restore configfs_depend_item_unlocked() to its original behaviour
> > 
> > v1: https://lore.kernel.org/all/20260914094426.25595-1-pavankumaryalagada@gmail.com/T/
> > ---
> >  drivers/usb/gadget/function/f_tcm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
> > index 9e6d4f39900a..2c2cf1164edf 100644
> > --- a/drivers/usb/gadget/function/f_tcm.c
> > +++ b/drivers/usb/gadget/function/f_tcm.c
> > @@ -1682,6 +1682,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
> >  		if (!try_module_get(opts->dependent))
> >  			goto unlock_inst;
> >  	} else {
> > +		if (!READ_ONCE(opts->func_inst.group.cg_item.ci_group))
> > +			goto unlock_inst;
> 
> Why READ_ONCE()?

I used READ_ONCE() because ci_group is updated concurrently in configfs's
link_obj() without holding tpg_instances_lock.

However, since link_obj() assigns ci_group with a plain write rather than
WRITE_ONCE(), READ_ONCE() isn't needed here. I will drop it and use a plain
NULL check in v3.

Thanks,
Pavan

> 
