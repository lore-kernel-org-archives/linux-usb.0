Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F939A807
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980716; cv=none; b=s9N+5pOOCngIv1wSiNIrlOmSJJurMu1qEf4QOojKWakHhyRUY2EgB8N/eH5s8JUxfxn7UDC2GPbcfxEfqwO0Xh+P+iEnuO720KPQ7QStvnSscyAxtZJ5vzCb2AA9cMZbYU0+PKjMkmne64uSOro4ZjXhVkZeJAY9Xx48yseQUm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980716; c=relaxed/simple;
	bh=ytZ80Ii6f9IM+ZdtLmqHySPkNKkTb6o/GqBz++/JJpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyf1ZmUov2dCGxm/K+heQd3h7aE3E98qRxtNc1fqCNcGDjiNWknroY7A56TuFUgGb1BvKgBPgPlkbeedtR1ZlmNTQAGMxKcBeBW1zL6yUr0WYWzCOINeVYVpoeSFNtTIEN9A87Nv19OkxDPu2B2xSY4R6AeTXXO8eC1CCQoZBuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Y5I3lLa2; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Y5I3lLa2"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930f72317a6so178878785a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786980714; x=1787585514; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuFhvVsiU968bd5qOkIbqBo7fYoO/EwmyIyy4yvWzX4=;
        b=Y5I3lLa2mtolj0YK0XtGq/lXbzykTGc3d/DmhpRvyxQTouTrd+3uARn0xg5W4UU1Xg
         O6zCX7RM+vRSWE3ajWRQcZKj5KaPAGGNh+uWx1GgPvfGQjlZFi1/qmFeMXCcisXL4C7k
         f9ylEMgwcYs/kRRdkeI/xzGdPqQOGd3tiwSoKbeSC3vmsjx1W8lwZiPrKZSgdQcaTCKI
         tck7uXzmP0zTTXOxTg+1ANeB/vGo9GAv9zzEzxiBBtyU9fWDHGWzkt/b7xqmxRU02Onm
         v9sqO0Psa+Ko0ieNZRHJ24Hh/5GtkK6JwA1Gke3j4NaIblTBh+Jbrf0vY7uPxzviGSnz
         o5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980714; x=1787585514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KuFhvVsiU968bd5qOkIbqBo7fYoO/EwmyIyy4yvWzX4=;
        b=a/6dDbC1uscSi38Tj4gPDd2PJyUos0uhhZHGPyDSjIubJREcl7JpH0AQgQozOrkgb1
         fBcp1SVt0nNHAmcC3AVituTclHT/s6ROS6pJtXMd6OfDKJ7/ASpm5NBB/dSHIJH9GMhn
         zx06K/xf12yO24lAqVPxuWJ3+mMA+qWiJ9FysORESx3J+f+FLyTcnqwe1AmOPbLKxpmB
         1A7MHgRNNbkuDyI3A6onKmjFBvxhNveVPJeXnwHIc2wdfthoji7B6zlBuOH/ID2rsM4J
         KmxrnBjdrJrc/Sv65MsTO65IUZy3xvqJWHervYffdcnqyqrv4DD5DlIajK7hECT4Tv7t
         3QVw==
X-Gm-Message-State: AOJu0YwTauU725YudmaMSSVea0iB+JBkuAn83uANVlB/EXpXJxH+Ed0Q
	ssT0oT6dIC3EvLDHhN9JsFKJVKIiFZSZhKJWIYKkuuo0Vhx3mEJsEBee7K8bX0LSdw==
X-Gm-Gg: AR+sD11NykGik1e7s+4SLDb6loVM2yglTl9Z1/88ERPxYVFYUbe9DL7OsZygvlY/n5D
	eB0Flo36jlVhCVvVvWihlVGiigJ/lVf+kMFDEDaMZaKbKn+NN4y1B5WDB9hFbyuRsbqxMyi/xH3
	Bh7/xQ9IckG+DjgTykbk7z5gNppzrorKvA9AVp0/dempu+kf/5nGNt0QYElR0yBAhkt0OnyfM5O
	IBtrK9uYhYKLasucPN+VfgWujok0th4/ZDDvEnBMy5xeSkMqHv8fvkbE+GpH9BqvQ/LO1r9ua1j
	QUKXpFuEBi/Gx/RMkretex+agHzhr7ZICtY+qtCZht/DRFlvIqOBJx/cegUHWKNo1yBsukNE+xa
	ovclTMOpKj4l3FqrXBxzISvWiXe2H/GuJepKshOScSfqlwdt8U5e1sNub7rOk9hroHvLEiXsbrB
	q1kKKYxD7kJmRBW5v+s1M40ZJcYuGeGu/ot8vkG2l2hNAh2dc5apvSZgMafPpWusZ0/TUYvvV18
	v5dE2GwpDzqVRhecoRC92YBZ8f8ejVzn/amIQ==
X-Received: by 2002:ac8:5dd2:0:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52dbd62b2f6mr16664191cf.12.1786980714098;
        Mon, 17 Aug 2026 08:31:54 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db60eb025sm17271461cf.5.2026.08.17.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:31:53 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:31:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] usb: f_mass_storage: Bump local buffer size in
 fsg_common_create_luns()
Message-ID: <64cf03c6-0337-4cf9-9d26-0fdf1406902f@rowland.harvard.edu>
References: <20260817104734.1031300-1-andriy.shevchenko@linux.intel.com>
 <fd2a7c76-c900-4ccd-92bc-d1205fe16d87@rowland.harvard.edu>
 <aoMiJSUsXVBvCzQY@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoMiJSUsXVBvCzQY@ashevche-desk.local>

On Mon, Aug 17, 2026 at 06:00:53PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 17, 2026 at 09:47:45AM -0400, Alan Stern wrote:
> > On Mon, Aug 17, 2026 at 12:47:34PM +0200, Andy Shevchenko wrote:
> > > GCC is not happy about the buffer size:
> > > 
> > > drivers/usb/gadget/function/f_mass_storage.c:2970:48: error: ‘%d’ directive output may be truncated writing between 1 and 9 bytes into a region of size 5 [-Werror=format-truncation=]
> > > 
> > > Bump the size to get it enough for all possible values.
> > > 
> > > Note, the existing comment is wrong as size 8 for the whole buffer doesn't
> > > cover 100 mil numbers, hence drop it altogether.
> > 
> > It seems highly unlikely that anyone would ever want to create 100 million
> > LUNs.
> 
> Completely agree (but see below).
> 
> > Why not limit the number of LUNs to some more reasonable value, like 1000?
> 
> I chose the robust way as different versions of the compiler may or may not
> that limit (yes, we had such a case in the past [1] and it required to replace
> also specifier and variable type altogether. Given that, I'm not feeling to
> rework that way. Up to you to implement, though. If you think this patch is
> not good enough, consider this then as a bug report (with `make W=1` it breaks
> the build, exactly what my case is).

Okay, now I get it.  The compilers' limitations are a big part of the 
reason for this change.

And looking through the code, I see the only way that the existing 
drivers ever construct a struct fsg_config is by calling 
fsg_config_from_params(), which does indeed limit the number of LUNs to 
FSG_MAX_LUNS.

So yes, please update the patch description to mention that although 
cfg->nluns is limited to FSG_MAX_LUNS (16), the compiler doesn't realize 
this and complains about the buffer size.  Then you can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Do you think it's worth adding an explicit check in 
fsg_common_create_luns(), such as:

	if (cfg->nluns > FSG_MAX_LUNS)
		return -EINVAL;

to catch the case where someone tries to bypass 
fsg_config_from_params()?  That alone might well be enough to prevent 
the compiler from warning about the field length.

Alan Stern
