Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9234FF78
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055798; cv=none; b=TfY8QLjaSlGGxcLeVNmBZYW91O/gIjADrMlzInj/NrzWm85HFVoykFsoobTr1irjMHPZ1Oel/FNSAGks9gf+UEOLM5kOyn4MrSNS45LRMgp4JoETwALH6URxWhiy7iFhYBd2vMb0waju36UrOAlzKE2Z1C5DivZPOXGnX3t0HHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055798; c=relaxed/simple;
	bh=TD8lKq4ystLfYg3uzT5qVpSCjbcK7ollxAN9yl/ptS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RICkoxDYPYX2MLfiodCqE1lYY4dHyZpvipRKfidl5H5y+EqJgEOwnR6XRrBB3RRffnLstXEgghswZn1fLrJYfouTM/CTIeBmn1YMr6Un0e88OH5DGNaz5jpzM4HF71UTek3NgOI1jYogyyM4indKEqpR37wqw3/2o0Gf5hbj5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sFUA0vLM; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sFUA0vLM"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51bfbe05683so36970221cf.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784055795; x=1784660595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AON4maRAJUj4gBm9jpFXBi/aAje+mEu1tQ86oVKIt54=;
        b=sFUA0vLM0WAmlgLOzDG0CCdw8Jkeknx6HduBgOWHgy+ZaonojrzP9GpbxqULZpvlZo
         ualUMuPWYF9I4y++1dmA4ju0RfzVAg3FyapOqmCvdDb5gvjhVuSNwDYhsgrPV4re5tBx
         0tIH6LOzLhS1KSUaA0R4wQxtjr4SL+G75IoYiM7CI4ezG+j/0jbCeNDv2/XpdStg7OOz
         t3BnCj9D1kXz9ncoKESyr05QV2F+Yoi6BEfHKgRr4mBrVdduxe2vlMN898l98Rwbsixt
         vowdDTID8g17j7EVpu+l6c0ChLx0glbIHGPcMW7h+KD5Mm6DBKLOFOGU2Q9dpbE/PwMy
         8CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055795; x=1784660595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AON4maRAJUj4gBm9jpFXBi/aAje+mEu1tQ86oVKIt54=;
        b=edtZJkhgMqYATLcz7mHrlHwL20DGFc8u52gXT7stww89isRKpRwVaAgVRXiZlc8FGx
         F0mw5/LQJ+nxEYornSsA9ttQbZgsiZfl5CpTJLS8EM9ODr5Ili7z0x0gAC4GlLinUn1k
         03H4eQ1IC76V2NBBvo/Jb/RYLaT571tdigCHkBQRafEYNaU2CR42zMzmr+AtzGgGE149
         m6y7lVXXkla22SyZUg2gHfahnNo6zW9gJ685rwiAPNX858H4cF1FervYxcPpEke/nOxQ
         e6hUcwr+0BbNXZAyWAOYYb10RcEdUHX/gqUCpFAoI8X98cdUw5pynVkwtg9tQA8Oyfdu
         YXfw==
X-Forwarded-Encrypted: i=1; AHgh+RpzIdeXv2p+KoA4X3JZX1l7e/RsVPSFNkvziChQM0iCGX+kJzzU5lWFQEwYElEOuz0S6mwOUhlIINE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfhbUlrnibOliJQCx6DeL/YBQXz3SzArY9HZbeKVXGHgCP4fHD
	4uBEMmr7O8L3+70nx/IA4NcsVt6lSrFrbfG9WgAEd/Of0ZEUE9jg5bK9aCWUi4I9Aw==
X-Gm-Gg: AfdE7ckM7XJPnrBDPRQxwOjUxeAEHaAKZDV9MsudzHbGGc1krlxEXOEKkXyV69/6N47
	SkbkzVvjw9fzUrS8P4GrqhsNDqKwxBZbqCuozJR3lz3Gvg3uN6dI3ZxFq4msbpT51c2jC7GFMMW
	4hHiW7Ragw7UJ1ZN3XYiP09iTFXWbA0ZoX+AkmtYmVSwMipFWlMMbwxlNEq9gEojSLlfHy1giRO
	4ZvqWT4vIDLKjGYSHveONM3buEJRHweyBWwNs/8cUr+jCrw83HMpTMIsSyTspKgv2DWw5aNb64d
	nvhBKq1d60KiYJuiONUULCmK4hpqBYbOmkfbr+NsND6RNBw9vYWtwyykO5ZcI19eANL/ExZlVGZ
	2w+yK6iFNgjFFu5xS7cu4GGf99EzjGt70pXldGHSU9BlMJIzE6X+xGSZQ3js8d52x+ViGpSdwGg
	8w6ybHhKBPpOM/Dg==
X-Received: by 2002:a05:622a:152:b0:51b:fe30:b8da with SMTP id d75a77b69052e-51e3c1cffe9mr50820721cf.33.1784055795355;
        Tue, 14 Jul 2026 12:03:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd82csm174762066d6.35.2026.07.14.12.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:03:14 -0700 (PDT)
Date: Tue, 14 Jul 2026 15:03:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	Colin Braun <colin.braun.cl@gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <59f596b7-5c90-4084-87f3-cc085ad4962b@rowland.harvard.edu>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <8d39b5df-1b85-4cb6-88c5-7478d6f4bbed@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d39b5df-1b85-4cb6-88c5-7478d6f4bbed@suse.com>

On Tue, Jul 14, 2026 at 07:57:21PM +0200, Oliver Neukum wrote:
> On 14.07.26 18:26, Alan Stern wrote:
> > At first I thought that we ought to have such a guarantee.  But in fact
> > we don't, because the user can at any time write to a USB device's
> > bConfigurationValue sysfs attribute even if the device isn't bound to a
> > driver.  This can create interfaces which may then be bound to drivers.
> > I just tried it and it worked.
> > 
> > This wasn't the original intent, but I don't see any good reason to
> > prevent people from doing it.
> 
> I hardly dare ask, but what happens if you unplug the device?

Exactly what you would expect: The interface driver is unbound and the 
device and interface disappear.  This line shows up in the dmesg log (I 
didn't have dynamic debugging turned on):

[406254.947595] usb 3-1: USB disconnect, device number 15

You can try it for yourself; it's an easy experiment to do.  I used a 
USB mouse for the test.

Alan Stern
