Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A0426CE1E
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288403; cv=pass; b=ZRzNqTH39A8StR2nSZKBqsKHi4wY8CBDHkEN0/6JSFTKGHBabLQn7Z3eB3eR7/TScFacPyd1Awoa292iRSUTAEfJoCtjf5+M1wQNPxkUwIF2IyPnzuHAWx8duvLOPzG9TXyW5aA4d9GT3vzhfYDngAotsE28zQLwxTdywN3EGMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288403; c=relaxed/simple;
	bh=gZeNPuamGXtqBkLQzEmuZPlOeqKMujWLum9QRt/g1bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2PH+m/hYyl9jVtPYSL4caxn4NcUYqgR+L767ZP0DtSB+zYCi7Z36BGZoMHsST60eqyo/2wlGCY4E9tjnO+w2iQ9PayOdk8Dn5ZNXuHZjTj+nKIWvd7Vh8M4jA4z6BMEk7cSSPM3DcQJyfWXFUcEc9sOSdmp+XlHmmxc7Nn9HCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzYxjx+f; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzYxjx+f"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c07ea058c0cso144947166b.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 01:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782288400; cv=none;
        d=google.com; s=arc-20240605;
        b=chhgDS1GdHV+c6FJVfLjQ/8jtughW0TV65hrUJZxkuX4+w6fBEq3L40yOFGr9u5sNR
         8YP+/lI1uPD22mSChkujQJSlTqatGTJOSEQNj6reXUYLFtb7lVVZTHLK8dMTJFMlpFJJ
         +Zj2wzn86DyXL6A4mRuCV6YzoYQ8Xva2vhFjsvs1Vmck/bCxtEE7eGI3PbnDwYwazXMz
         vW0VeBRwi00Vz6+MunJKzAA9igvcwG9N87yutiwdzxPjEJgS/gLJcWO4QHI/2eWFEDK+
         2EXvcY2IUgFp1E/5PU44RSQ0V+Qpzw991hJQDwT+9MpziE+wIyHeTTf2Fyu1JfVtZwWX
         mHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lM0sj/gFrnWNNsB/THsiD2+stmMptnCgeunijBGiJP0=;
        fh=cQQC4ZcnSDaZ03G3vNlFyuY8RcJWNy18nF+ZnOE1ImQ=;
        b=WmtyT3//To1XiRaSR008KhLEz8weF3sNu/4wfPgtUsedsSoz2dUwXnSsFhrEiJifmI
         LD1GYLRyHrgJ0ZhXV6QNhVo8tEEdnB18Gjt8aWNj+uPjEi1nSwY/aWS132MqD/RGFMvq
         06FpjmGpkQkrn4B1WTfK08evu4C+4lkrRPcFoWbIfXU6ed1Z58BovGOsgsYTEDIxT03y
         6BakjHU1aGW47H7mEibE/q6XJP8GICj/t5sQgkidZDmWFlqTwzA38TsdrvZsPBzOS1gz
         EnQNnZ2ghc3isHWhxPEjJIbFhXw4xzMgFnJdFHXbix0e7P+PfDuP207TmjVb5OTzQpv7
         qVpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782288400; x=1782893200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lM0sj/gFrnWNNsB/THsiD2+stmMptnCgeunijBGiJP0=;
        b=IzYxjx+f4Z8/We9K/7J6kIBnc5HIvl0pZPGjt0PCA/kXigCxu12jPdOVWcGNxvdVyK
         le0cfMTSELGrd1aLyBTP6pYgGScgfLU04A+24F0B6pv/D9vnq+35RwZlBlccCGvXCZFr
         UE3SrjCjoEweZGjKoK2Bqp/fDjb+CjnkVMLXUSB4xv7JWSVpFuu7B0Fv66RGcr7QM0NK
         8Rb0U5IxYYWbeAuCsCtBpY+Q2riaUJdnYOkrIDAiOSgOKMkMkpRU8SaoWGhNLY0EqE7t
         EMAl5Z/D5GX0h9L0L+zHv1H1oFJ6izYxyrlPJlzaa/8GvgX/Vz1MciPYBKvHqYGKErCC
         yxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288400; x=1782893200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM0sj/gFrnWNNsB/THsiD2+stmMptnCgeunijBGiJP0=;
        b=AobVOzohYtP9rcPZ4s2VKTfOCpK8+7l9yRipB5B+l+SfSCHBlofXRcU5bZxlHhLIoG
         j2+n6N0HlMRieLKvLAqVVujgIYAd71m6xDeMFuun8DNRh8gWoMMi/1nDq4R64/2V+pKA
         QERIe5XIEXuJH1DWL8ReR1edV3LlJn1tb49w/W7fEWNE1OvuWDrUnvDBNtInVHu0ba5g
         ofYT/eCcdUB8ZWc4x4Aq0mWjrfefVX4vdl82D1qW51NOOc+sezlTG7UssrB219NiF3BG
         dlVp1QO2SJ1KTupiyAMAxg1q+3Vm6Gv6tYoNw1kjTA4YBIcc/UwKhWVzncHF7WbjRb7v
         u8kQ==
X-Gm-Message-State: AOJu0Ywj93fEaEXiXRkvJ4JNy6QB70gtZ4EA4v61MPuAlNkk8tcNAs/w
	6i0qzSaZLdcywANXncpsXD2kzgBe4AiwFyqQpy2xSBxWzMSgRETqLjANJYsSIHH3ynTRdlh9tyD
	Gw4NvOibxQMhg+4rpewezmqqZAB2Myw8=
X-Gm-Gg: AfdE7ck9YQ/lPNgOfb5ikAZnYyZRsPAYvU60A1iXzV8Blabh9Mgrj6c6Di6vPSXI9VT
	hQesyrpaHqoZzEBJ9lXtyUrZdYHYccxU3anA+pbHGdhNdF50jK89m2gz8UrRzA9o0k0rBdpq0M8
	FXLz9Fdzqynu2wCTkpeZpir/GedCsAvsdsOSyYF026BzEkXuhNFN0rchfvGVqboi6XFH2WoMW5g
	Nt+/CQd7X/tmlcLgQPwUOcX6EpVaqmVNagKvyJhXsSxlM0cCQ0fJ/VclbzsRh2dydvbd5JLtQ==
X-Received: by 2002:a17:906:9f86:b0:bfa:f563:9294 with SMTP id
 a640c23a62f3a-c107e0dfebbmr347805666b.18.1782288400043; Wed, 24 Jun 2026
 01:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com> <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
In-Reply-To: <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Wed, 24 Jun 2026 13:36:28 +0530
X-Gm-Features: AVVi8Cdz6KHrxpF6FVDarjMSsiC-uOJ-UdMHqIhmrG7YgFP-x12nJ9Fo0j02HUE
Message-ID: <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Actually, the best approach here would be to put this single change into
> a separate patch that comes before the current one.  That removes issues
> of making more than one functional change in one patch and improves
> bisectability.

Before? Shouldn't it be after my changes? That would make it easier to
justify the changes. And just to be sure, you did mention it does
align with what the intention of USB_QUIRK_DELAY_INIT, but it does
change its behavior when the quirk is not set. Atleast from what I
understood from the documentation and an LLM's summary, the device
needs time to prepare the full configuration set. So, does delaying
before the first header read really work? I can't test this since I
don't have a device that requires the quirk to be set.

I personally think adding a condition to check if the quirk is set and
then delaying before sending the first request would be appropriate.
What are your opinions on this.

> The style used in this file is to indent continuation lines by 4 spaces,
> because some of the continued statements are extremely long.  If you
> want to align new continuation lines with an open paren, you can -- but
> you didn't even do that in the example above; you aligned it with the
> space following the first comma.

I will make my changes more consistent with the existing file, i.e.
continuation with 4 spaces.

Also is it fine if the string lines exceed 100 columns?

Also, is there a need to check for krealloc()'s return value? Since we
are only shrinking the buffer, there won't be any moves or completely
new blocks (at least as per my understanding). Do I still need to
check its return value for completeness' sake?
