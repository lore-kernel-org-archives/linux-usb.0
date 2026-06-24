Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1536E228CB0
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782264960; cv=none; b=TezKwfj+ZevY3hbAdXByNqcSjceU3k48MNEiF3OcFf6hY/FxCf7+8Oxrq4N45pZZ/AznOUNrlyO2SJ5btuFkBNWNDHnfRGsQ2ig0kTLuQyLgWEEJ/0ZhDlAE3V89zCBaQEDc02dzOpEDbkQ8U3gEvEwB4IsiE3WL0z4ejy1O1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782264960; c=relaxed/simple;
	bh=2cVaFga+65dyxq5fyUU7g2cHTGGl6qw3goVZxZqgnAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbuFNFyVvCbD0HmPxG64/6M6xxz+3ZIETr/vG/MaOULlyLTiFXcKKhz8EQ7RqQkWWbKOJlJi9bycLgpph46QxmvzkL0cKoEXFSTtS4hPnGJ97vuYEic7VCW9fZRu1w14zAWVpnc7q5vkpl2UDdQDMbaZ3dKIO5vy93Lozi4Pcnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lKo3FBPD; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lKo3FBPD"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51788280e71so4273711cf.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782264957; x=1782869757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9taatE6id6TePTU8SCXYGtw69S0M9czLSbV3oEX+B5M=;
        b=lKo3FBPDg6b93rlaw0CQcbYvplJLN1hsBbcYOiW8Ee8q8UlpVFRmxIF2OltAN+RNb+
         kfbHVmrppwTFs45B+CAYRuMiWjEE+Int7gVcMPdGK/abqmKFBhihMVS1eS6qZiEXk5lw
         sAQHpoDIRIoFVSfedHWnT80EHyjNoEp9+7UVcrs4/8WFpacv48O/NcG2A0tfRcofW3nK
         iGX50UDQEK6Y3AdJ3pFrWS1f+162kb1fAN0/m7l1IakJ/z++1A8cj3MKMSRvGyu7CP6S
         abYY9TT/Y363qO/yazQzUvak2hgNYjxko5+NIneIsQ9P+QTHYh5WkDsVEx+MrCFKrquw
         dG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782264957; x=1782869757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9taatE6id6TePTU8SCXYGtw69S0M9czLSbV3oEX+B5M=;
        b=cyFe2+Row+dySy9uO0XnHNepMXHIGcb9ALbU1/E7O3FhMluAIrn3InTNlpHwZJupZp
         YmLSATExj12Y7YNsRqMmIBn7uY4tKSUDj2HxT3YU/iLYRh0Mxha0T7RDktZ+ulSvuMDL
         6opNnmfsGa5bUKxEflDDfxxfOVbbaUAVUu9yWFs3/tiG/AiAkSXu2n1vHt2JnxLSq8Mz
         jJ2JY2dLg4ZaM+G5BErZWvs2FUluB0B62X6e4+zl7nJcjHFvyCOmA6LWgUvQSzVWHICM
         DbO9ZsR7Jc8RM35xMtanzoBDTyZQvdP2Ii53M1mMIj0D0yHJ4yinBKX00DXK3cZOyuLw
         gtvA==
X-Gm-Message-State: AOJu0YxD5zPi5j6BHTSn60kOo5UZ3RXehK4n2LhmiZXIBRM58NoZZVTa
	EH1EFG7fssUO5aqogmXlIE92mnnwWrVA+/senH75euSvtu/R73MFyB+9R6rGQw00lg==
X-Gm-Gg: AfdE7ck9HQiJQqjpcYC9Shr6Vlm/Pr1+rBgf64/boI6JL/9vVctnzvAhfLAPsbyKx1+
	HCP8Y3XGiP9P7I+A39Fos7em/5OY4vRwkKB7dMa8whqbk9KRefGKxdzD6PQjWhgUvdm74F+NgOG
	SJP98SXgTXbg2n0rd+PtYSv0L3Atxpjqr0cN4Gpsb0vMiBEYLXhWq2uUKgzrAaowDhSq3IkfpuH
	mJsvcycPseT1JbVRKJMXDMIfIXODtjlBs9DivnaNzhUx1sbC3GYcg0nkrUEWlv/b42mnaezurCE
	c4OQumSUVS/KCAISvvyhEXEMU1WUqEfcBGVoGnvaFr60Khv9qrbvrBPUY0JsEJn1hFiXMSt8mGY
	Yn+a2D3QFHyzKvTdWy6r49sdLSmtI0SHL9fEt615Zg2/JKN2UYul+GcZ5Ahg9b75GUX/nAbTmAw
	OOvKmcGs8jAORwLVg72sP0Q2rVCqUHIfwQ
X-Received: by 2002:a05:622a:609:b0:519:ff6a:7cd9 with SMTP id d75a77b69052e-51a06938e9emr270710221cf.31.1782264957030;
        Tue, 23 Jun 2026 18:35:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a514b4f93sm35410741cf.2.2026.06.23.18.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 18:35:55 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:35:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>

On Wed, Jun 24, 2026 at 02:44:07AM +0530, Nikhil Solanke wrote:
> > Moving this delay up here changes the behavior when the quirk flag isn't
> > set.  While it agrees with the intention of the USB_QUIRK_DELAY_INIT
> > flag, such a change should be mentioned in the patch description.
> 
> How should I mention it then? Nothing comes to mind besides the
> obvious: "Also move the USB_QUIRK_DELAY_INIT sleep to before the
> initial descriptor read, so the delay applies consistently regardless
> of whether USB_QUIRK_CONFIG_SIZE is set.". Or should i revert it back
> to original position?

Actually, the best approach here would be to put this single change into 
a separate patch that comes before the current one.  That removes issues 
of making more than one functional change in one patch and improves 
bisectability.

But to answer your question: In general, a patch's description should 
explain the reasons for the changes that the patch makes.  Especially 
when a particular change doesn't appear, at first glance, to be related 
to the patch's primary purpose.  (On the other hand, it doesn't need to 
explain in detail what the patch does; we can see that for ourselves 
just by reading the patch's contents.)

> > > +             /*
> > > +              * Grab just the first descriptor so we know how long the whole
> > > +              * configuration is. In case of quirky firmware, try to grab the
> > > +              * whole thing in one go by asking for a 255-bytes sized buffer
> > > +              * mirroring Windows behavior.
> > > +              */
> >
> > This needs to be rewritten, as it is self-contradictory.  When the quirk
> > flag is set we issue a 255-byte request to mimic the Windows behavior,
> > and only when the flag isn't set do we grab just the first descriptor.
> 
> I am sorry I didn't understand how it is self contradictory. The
> comment does say, "in case of quirky firmware..."? Am i missing
> something?

Literally, what the comment says is: Grab just the first descriptor, 
and if the quirk flag is set, get all the descriptors.  That's a 
contradiction -- you can get just the first, or you can get all of 
them, but you can't do both at the same time!

> > >               result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
> > > -                 desc, USB_DT_CONFIG_SIZE);
> > > +                                             desc, usb_config_req_size);
> >
> > Don't make extraneous changes to the existing indentation (or whitespace
> > in general), here and below.
> 
> Well the linux coding style guidelines mention that those descendants
> should preferably be aligned with the function open parenthesis. Since
> i did "touch" that line/part of code I though might as well indent it
> a bit accordingly. Should i revert the indent then (in this and the
> other place)?

The style used in this file is to indent continuation lines by 4 spaces, 
because some of the continued statements are extremely long.  If you 
want to align new continuation lines with an open paren, you can -- but 
you didn't even do that in the example above; you aligned it with the 
space following the first comma.

And while you did change some nearby code, you did not change the code 
in this line.  So reformatting it is not justified.

> > >                       if (result != -EPIPE)
> > >                               goto err;
> > >                       dev_notice(ddev, "chopping to %d config(s)\n", cfgno);
> > > @@ -957,13 +976,25 @@ int usb_get_configuration(struct usb_device *dev)
> > >                       break;
> > >               } else if (result < 4) {
> > >                       dev_err(ddev, "config index %d descriptor too short "
> > > -                         "(expected %i, got %i)\n", cfgno,
> > > -                         USB_DT_CONFIG_SIZE, result);
> > > +                             "(asked for %zu, got %i, expected at least %i)\n",
> > > +                             cfgno, usb_config_req_size, result, 4);
> > >                       result = -EINVAL;
> > >                       goto err;
> > >               }
> > > +
> > >               length = max_t(int, le16_to_cpu(desc->wTotalLength),
> > > -                 USB_DT_CONFIG_SIZE);
> > > +                             USB_DT_CONFIG_SIZE);
> >
> > This is another example of a change that has nothing to do with the
> > purpose of the patch.
> 
> Isn't that what you told me to change? So the logs are accurate? I
> made that change because you suggested it. :')

My comment referred to the two lines directly above it, and I did not 
suggest leaving the code exactly the same except for indenting it 
farther.  Or inserting an extra blank line just before the assignment to 
length.

Alan Stern
