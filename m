Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326FE1684B0
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309673; cv=none; b=e5HIN1e6vfDkxopjj3vGBU1gP1QV4EkjDOq0YU8PEKxdk2tVvaxzE9JMLDJ4iquFHXSeimvlpV3fB5sKBqATgZfgaL8MYwzljxGaPkSR3kbxL8atAmOv56tI3Q+E/kfDDtZ+P+p7JvUYd5kCGDdqNr5qBOmDP+wXLQO5NEWqP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309673; c=relaxed/simple;
	bh=sqz/nCl4XMoZ5TKKVVNz5tAI/LScRoJeM9WbyPmJx3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBWX/PWsN5XK3JqiTh5ZIbWeBRhjES7ciRiD82fHCWV7QbD9+nGT8XFFErGJ2qlWxcor8fc3o1L3HliZoZU7dTj82QLnfvh+Uq2aFl2q8mJ23h8ZBXMyK7ECS+t+tXGcKGTh3B6V0Zz3eAP9+WLpSkNHYItEuVgf6yJDMSPSd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KstfDJkD; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KstfDJkD"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92120eb916aso102432285a.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782309671; x=1782914471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsEoW4DBoKT0fUYLZPdL7MZJTkz7+GAlNaoQ4msQnkg=;
        b=KstfDJkDlEZuT1HYy2wLN0zzVO7os9Mav9CMPrsd7Kv98rDcLUS7Wg5ukVEMLr3LVG
         wrMAP69DjNNNzDVB2ZNOfiTOc1hFWk6LOgZdLKLlC+joHQiuqFZ40e7hNzcPh9oWhGY/
         2G/O2HjDTmBS9oRGG1S37xQaTYUM3wBJHlcPNdyjlvsE1IDgBr7ovk0ZlAyLMvD5K4F2
         s+LsOd3mFqtYmxhVb2PFHtvW7RF7jgiJBAVwWIQuzP65aYXobwjDznATwWFVkYABsJXZ
         LVH9wW2TsSZf+p2SWTS7/3e2nLXqldUfpW6QUJzVbbrD9x+kGVzbxfNNIV+4CBNNqAON
         puzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309671; x=1782914471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsEoW4DBoKT0fUYLZPdL7MZJTkz7+GAlNaoQ4msQnkg=;
        b=SGqEA9HuYulKVDmsKp6IjBqUrqJ6cCvTU1zA311/rat0y3hP56HqasWxvkpZ0eOTks
         /8pYgtwtVujUK+5iZmGOu+d7ihXs0dojh51cOUZDpEuyYtfSWZB2RauD7eW8UXIgzO3x
         OMqXFLh4Q7ftUwWMjZcaT9fV58TIUmABuDRKyOyqna0v/NJQDV+j6j3KhYpF9dtWfF4q
         XKVpMzstTBjzIGqZPqVhWOHd8/wffhErLBGy8sel4a34ES+hLKJKjn4aEpDt4ic7bIGz
         0gmBM3y6AN0JwKwCuUjh3LQg0InyS1+cRuhywqxHKrTkoocrmxDAM24QlDaIli+D/tRN
         UUIA==
X-Gm-Message-State: AOJu0Yz+RO4shSBMioQwlEc4mm55NjzEq9PJaiftQcOEaN/ZvrD4/jnu
	PUAgyDworcAR+JYVNStgodIkcufmErN/N7e1pctVLsT1JwBja/tY0MDLOs3kqKakAMwaImgs2b3
	VpCA=
X-Gm-Gg: AfdE7cmJJvFBObsw+FGU24cD2HfD+EIAJAagiRoWWdRLCQDM5WYlzVFgTHOSXEKGPJ+
	XFEK2es2iZcVHiXyqKWb9ZWK0rfFjlXv0FDG2ZnviB5AnznDnKwFi6KtZv7I07cQxzL2HeAr3S1
	4pkY4/SZ68C8ouNC173S3bAi4qEQm7HHnEQY/o595Vr0jCPbwncS26Dl7+ocC+kyivYl4Ywu79i
	jk8pNkT5tvvYpsAPMrW4De61WYvNqwc5Z5DJ7XYITkbCiJ/cnVKyWtEF6zEFHK/y3+78misWSFl
	mGYKzTst9xRw7beBB79KDwdTY3FLR7FyTZpkVZr74iAJyBeOZJiZo55dcf1jScgFn/UeZTxNgxV
	3ZIlvgCorfmvLyJVusb4xBCx8td+y3UNhDa04vIn1H6/RpY3jEf+qhNVU7YFxXQv7C6i5ldK4Zu
	HNTRNa7aCNVPWIePpfdTm4tXQKUoOCZ+4A
X-Received: by 2002:a05:620a:1a09:b0:915:cb5c:7f70 with SMTP id af79cd13be357-927800a2787mr561454085a.29.1782309641938;
        Wed, 24 Jun 2026 07:00:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92600c7bf55sm552191785a.46.2026.06.24.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:00:41 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:00:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>

On Wed, Jun 24, 2026 at 01:36:28PM +0530, Nikhil Solanke wrote:
> > Actually, the best approach here would be to put this single change into
> > a separate patch that comes before the current one.  That removes issues
> > of making more than one functional change in one patch and improves
> > bisectability.
> 
> Before? Shouldn't it be after my changes? That would make it easier to
> justify the changes. And just to be sure, you did mention it does
> align with what the intention of USB_QUIRK_DELAY_INIT, but it does
> change its behavior when the quirk is not set. Atleast from what I
> understood from the documentation and an LLM's summary, the device
> needs time to prepare the full configuration set. So, does delaying
> before the first header read really work? I can't test this since I
> don't have a device that requires the quirk to be set.
> 
> I personally think adding a condition to check if the quirk is set and
> then delaying before sending the first request would be appropriate.
> What are your opinions on this.

Well, put it this way: If you change the existing behavior, that change 
belongs in a separate patch.  If you want to redo this patch so that it 
doesn't change anything when the quirk flag isn't set, that's fine.

> Also is it fine if the string lines exceed 100 columns?

In lines containing long strings, it's okay for the string to extend 
well beyond 80 columns.  But then you should break the line at some 
point closely following the end of the string.  I'm sure you can find 
examples of this if you look through some of the other source files.

> Also, is there a need to check for krealloc()'s return value? Since we
> are only shrinking the buffer, there won't be any moves or completely
> new blocks (at least as per my understanding). Do I still need to
> check its return value for completeness' sake?

It's a little tricky to track this down, but if you look in 
include/linux/slab.h you'll see that krealloc() is defined as 
krealloc_node(), which is defined as krealloc_node_align(), which is 
defined as krealloc_node_align_noprof(), which is declared with 
__must_check.  So yes, you need to check the return value from 
krealloc().

Of course, you could simply try not checking the return value and seeing 
if that provokes a warning or error from the compiler.

Alan Stern
