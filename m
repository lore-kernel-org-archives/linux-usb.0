Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5938817A314
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 02:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215690; cv=none; b=O3jkdOw2CtnhyckOirmv7Ot5LbuxITgbae4yten55EkHX7F0Z2XivBjHXOBIM53yhkMhe33m6jh9MYNwMKPGBIhDDssPy3GRhIHGs8ZIuWEBoeSn4Zi0oR1x79BodVRNsgYnimr9ZPNkhZjvMpGKm2sD/H7zj5XZBdT4hIrZzoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215690; c=relaxed/simple;
	bh=08zsvkP4JMji7+0Nf6tmH29d8PQt/P4Oepv6S67lLuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSzf4m0d+urapQeYNP4caquysxGImh8ljzyIQV4FbiYPBTsPjzGiq6jqyDHzavbWaoVqUhrmifYj2zBP+aOuk4CcDvdXfYwBvQzx+2eF7RP14gk/g4u5u33C6EbADtXTWgOlXQvGKdKX1X5kL9HkqybZU5Lz3Wn3u1y2rRwuv5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=l+nnMluq; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="l+nnMluq"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc71so13241171cf.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790215688; x=1790820488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bER+cZDq+Q3JLSKpM4l7jeILKD4iTj4qEz3R+6KrJ4E=;
        b=l+nnMluqb0lK5WsslJfOUKYL5bNvvuZ/hwWVBIEuLtK7Vr+uKx8757IOw2L7VUq23O
         4yUGkkE2DQolHw3sZZDa620Q/7PYXSXmRiatXpaBCX+F8c+XuTPfCp9hIYeP4VaMkYEl
         +5JAStQJ9t1X11mOJ4678HTInt7PNZ4iKR9uWWQrXzMfFcZfo6HTsrnbpFOl8P8Z10ww
         lI5TNOFVCcbWT42dW4ku7pSn0g0ka01oMCJsdB0uXuJF+ZqQAptn3FrS8rDPQYIUhnol
         x/uWCGrOdTjH1hBI6nj2Se0JW1RnhldeUO6Qwe3+TmH81t87LjKBXJj8CbrpWjfLZKWO
         vGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790215688; x=1790820488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bER+cZDq+Q3JLSKpM4l7jeILKD4iTj4qEz3R+6KrJ4E=;
        b=f/uNKIkTWuJGJWSQNqSk9a8EWCDUPfHS/L23STH3jDF34bFCOINSUMbXt3f05df/RK
         Pxr5oZSxVFVXZPb3aHrOxNcqxBdVBBgT+yxQvfy+dLk/tsDvHql4eSJ3ibqmdbbCjunK
         whpv+1ZSZFTE+afvZgsSBDx5dqPGuX1yKZFkp5lGln2+KdTTwR2fSR1rlYMy5tD3YK6m
         zwz5TTYDZKuEQQ8FOjLzZlloBsLXbGsJYJk+0L3g1bEkTcOcS9F+DsG1XXRCiVvs3jTF
         /xjXVWRjKdE4LmpHOM3sRDrHYvNSSLQhYIFJYv9A2qfwBNvwrLfYh/VRcM6S0GmAiNiN
         iFaQ==
X-Gm-Message-State: AFuF++k0R7ocaGVdxf2UCt89fs9EIFIwbYHBypEauPJj9uGEvABrjbv/
	e/QKER77DTyQH+CN9t8Zhv9r+t88TDyHeeDwXqV9TLjYVaC7GPken60L1iG08Q0s6DKM4pOBiMv
	5Df06/A==
X-Gm-Gg: AYBFou10iJiNF1ZdCkBEWH3ezbo/6spOkvz3m/Uiqu1pRew33pBG00xHMPpfoC+MJRB
	Zx8x33YBKukuI4pYT47l4613DlvMO4fxA1+Juqz6eUf+YVSUkOEOlP4rP9HUzR9Y1T0V9IasWXx
	OUKkbJ2B1lLCtgmWrNG86fBIYuZwk5fVrPPTOJgixr/t7mUCp1MvvvCLrjypxqlDlFI45qm66I0
	bmKN9wMqHo0s1g6D2Dl0ykoSA7BQVcbJF2ggI+wVMSh9HC+fg3zgcPrsiH0y7armUL5cwNZf6xL
	RvDals+BcLxEMUnkGLewMm83zFTUBtZhlI3dJh7HKqxpGncH5WePw4gmWc9gpulsEqvegRBXadq
	JM0xaD6vV/fXMtDLvCUubWZE2IBwAe9xWZqn2r/CQySIsmahgSzmr3M8wkPYky2Ut8gJ7jePvXn
	pCSHPW5bU8sJxs5nVodv3zjsIgBjTRYz7H7NxzN15D2TCPOCSmUpxmq04zYzTVzE/UigSvDwkWF
	sJ3mLGB9b0=
X-Received: by 2002:a05:622a:1827:b0:532:99e0:59e8 with SMTP id d75a77b69052e-532fe9f45e1mr4241091cf.11.1790215687813;
        Wed, 23 Sep 2026 19:08:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb4200c9sm31926251cf.23.2026.09.23.19.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:08:07 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:08:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johann Klammer <klammerj@a1.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: possible regression in usb-storage?
Message-ID: <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>

On Wed, Sep 23, 2026 at 10:01:05PM +0200, Johann Klammer wrote:
> I managed to get a usbmon trace for the device. (no uas. 6.9.9 kernel):

It would be better if you could do this under a current kernel, such as 
7.2.y.  6.9.9 is pretty old.

Better still would be is you could also collect a usbmon trace under an 
earlier kernel that the drive worked with, so we can compare the working 
trace with a current non-working trace.

> > c6f9c900 1170412013 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
> > c6f9c900 1170412180 C Ci:1:007:0 0 18 = 12011002 00000040 c20b3920 01190102 0301
> > c6f9c900 1170412186 S Ci:1:007:0 s 80 06 0f00 0000 0005 5 <
> > c6f9c900 1170412430 C Ci:1:007:0 0 5 = 050f1600 02
> > c6f9c900 1170412434 S Ci:1:007:0 s 80 06 0f00 0000 0016 22 <
> > c6f9c900 1170412679 C Ci:1:007:0 0 22 = 050f1600 02071002 0e0f0000 0a100300 0e00010a 2000
> > c6f9c900 1170412687 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
> > c6f9c900 1170412929 C Ci:1:007:0 0 9 = 09025500 01010080 fa
> > c6f9c900 1170412933 S Ci:1:007:0 s 80 06 0200 0000 0055 85 <
> > c6f9c900 1170413180 C Ci:1:007:0 0 85 = 09025500 01010080 fa090400 00020806 50000705 81020002 00070502 02000200
> > c6f9cb80 1170413187 S Ci:1:007:0 s 80 06 0300 0000 00ff 255 <
> > c6f9cb80 1170413430 C Ci:1:007:0 0 4 = 04030904
> > c6f9cb80 1170413434 S Ci:1:007:0 s 80 06 0302 0409 00ff 255 <
> > c6f9cb80 1170413679 C Ci:1:007:0 0 26 = 1a034500 78007000 61006e00 73006900 6f006e00 20005300 5700
> > c6f9cb80 1170413684 S Ci:1:007:0 s 80 06 0301 0409 00ff 255 <
> > c6f9cb80 1170413930 C Ci:1:007:0 0 16 = 10035300 65006100 67006100 74006500
> > c6f9cb80 1170413934 S Ci:1:007:0 s 80 06 0303 0409 00ff 255 <
> > c6f9cb80 1170414180 C Ci:1:007:0 0 34 = 22033000 30003000 30003000 30003000 30004e00 41004300 44003200 35003600

That's all normal USB enumeration; it has nothing to do with 
usb-storage.

> > c6f9c700 1170414344 S Co:1:007:0 s 00 09 0001 0000 0000 0
> > c6f9c700 1170414555 C Co:1:007:0 0 0
> > c6f9c300 1171416007 S Ci:1:007:0 s a1 fe 0000 0000 0001 1 <
> > c6f9c300 1171416088 C Ci:1:007:0 0 1 = 00
> > c6f9c300 1171416152 S Bo:1:007:2 -115 31 = 55534243 01000000 24000000 80000612 00000024 00000000 00000000 000000
> > c6f9c300 1171416213 C Bo:1:007:2 0 31 >
> > cd1e5480 1171416219 S Bi:1:007:1 -115 36 <
> > cd1e5480 1171416337 C Bi:1:007:1 0 36 = 00000612 5f002000 53656167 61746520 45787061 6e73696f 6e205357 20202020
> > c6f9c300 1171416342 S Bi:1:007:1 -115 13 <
> > c6f9c300 1171416462 C Bi:1:007:1 0 13 = 55534253 01000000 00000000 00

That's a normal 36-byte INQUIRY command.

> > c6f9c300 1171416492 S Bo:1:007:2 -115 31 = 55534243 02000000 64000000 80000612 00000064 00000000 00000000 000000
> > c6f9c300 1171416587 C Bo:1:007:2 0 31 >
> > cd1e5480 1171416591 S Bi:1:007:1 -115 100 <
> > cd1e5480 1171416712 C Bi:1:007:1 0 100 = 00000612 5f002000 53656167 61746520 45787061 6e73696f 6e205357 20202020
> > c6f9c300 1171416716 S Bi:1:007:1 -115 13 <
> > c6f9c300 1171416837 C Bi:1:007:1 0 13 = 55534253 02000000 00000000 00

And here is a repeated INQUIRY command, this time for 100 bytes.  That's 
a little unusual but it should not have disturbed the drive at all.  And 
in fact, the drive did respond to the command properly, with 100 bytes 
of data.

> > c6f9c300 1171417312 S Bo:1:007:2 -115 31 = 55534243 03000000 00000000 00000600 00000000 00000000 00000000 000000
> > c6f9c300 1171417339 C Bo:1:007:2 0 31 >
> > c6f9c300 1171417347 S Bi:1:007:1 -115 13 <
> > c6f9c300 1174819198 C Bi:1:007:1 -108 0

And that is a perfectly ordinary TEST UNIT READY command.  But instead 
of responding normally, the drive seems to have disconnected itself from 
the bus after about 3.4 seconds for no apparent reason (the -108 is an 
ESHUTDOWN error code).

Alan Stern
