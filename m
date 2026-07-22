Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2A439F62
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737545; cv=pass; b=L3IcQUn1RET718GujQeZ8dcIDmXIwV8+LVuDytNi506qzvXA1eeSA4NKIlXtThS3b0dTIwKBqmltBldnR9UbyO+OgjDalWMawmxfw54Xl+H3zyvNpzbzz6+Lj3YGy3gOS8wlL3tG4GN4b2E7NEis1vT568LtbX6PTKGqcgoYLTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737545; c=relaxed/simple;
	bh=dgKunBaD1dP/eqVy3A0wkDQ4Mi805hagXOXzddL7tw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuPvBaPTCKotHIxYfwteqko9/VJEbMSKLlrAHqIcW+BtTJadjuAB6yfDIuOm0luSNpZOM37bL+NfvP0YdQwVtGgAie3VgzmWqIBxIk5yqYQIzOeGp7CB8e5KXfrweFcX2aR2LkcKLA/8S1yt/QM5qF7hGIxTxcYgYY18PIbKhYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfUiZamk; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfUiZamk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698e5859a3cso12879534a12.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 09:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784737542; cv=none;
        d=google.com; s=arc-20260327;
        b=kbBWFcdK0txfUEGgsDKHzwjTlQZ76XhJOa5UZet+VfS/pXJJysWAD/K/1Qiaa9zhhx
         HrD9Z1LTXafOYklkwxAAGOM5twRFcIdER7tUPTV4B1Mq4bMJe5MvmHT7+KOx5FgSf6qc
         f08BX7cIRI2WBCcd89tWQrofRech+pCdXsFNOMiKYeYzs0XofPFDsijT4Jie3mtOIkDh
         okMLoMWk5W4aVT840LNgDsAjO8S5ThBLShBbv7xqlx0FtmTFKBvkH+sJS2kLN4c43iDh
         FBYuQKpwMRd0Z+f4/Q+yDvdNR+TQvD5zCj1yZw6R3tQPCUVksZWHi8Az4z8mBaQQvSk/
         RDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dgKunBaD1dP/eqVy3A0wkDQ4Mi805hagXOXzddL7tw8=;
        fh=UdMJh2aWKms7teeIJoz2+iRwuazgxt7jMKZAx+sYLXo=;
        b=q7f/0pDK0rjM/2Z7AxAKtY+kmRjLlvkuZ3/xJNX6aNMxN23mtL/YZJ96+zBCipHlFN
         Bu72HHWJ23XP5DJehqY7g1sC1Khdzmn7gc4aWmdKMNndmA/kZWapQbdaAumyI3XWPzdw
         96olSt06ZjPiGqYLJNyPmyF01lb8uNuldy0Azq8PDb9kjBvl4ufLj2PT+LKJEWK685Ff
         C/pBmy0AGhGN1Ip7++FlIvnBCiB2xaEZ1+6gkxeXi7DbLqO4HzeylExlYfDEaZ7y1EwL
         dJrFjzsGhelqpKPd2N+oz2wcVMd1I2XGcB5qNt7LSRsQkgVGYQT085Dp8lVFuKUbhuaz
         zHcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784737542; x=1785342342; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgKunBaD1dP/eqVy3A0wkDQ4Mi805hagXOXzddL7tw8=;
        b=UfUiZamkerX4L1/zYyJmhzDqeJ5COWGKBLg76k/yuBcxxwVybTtO6oUkzFLA+Ko0e+
         fNxBDVhUONniKrxJ7f/dau8gUSHOL6qoji2/k5rxCMf8AHKXaEjDKKO9hTDSPetdAGBF
         lLpFDmz25v43tFmlVAk3UBbu/ACRi2o4Zp0kVleXbZOSiO5yWdSA7XLWStax5WTewvOC
         WuE/7x++/eYXKd+yHkwpY0SgTveUxwNNR2O83f1MuVBnVHa+u/mgiBXKs06DcDO9of1J
         mungh3cBCSjUfAzBYkaHoaPzwhqAq7UMhNgtEyCzMkyp1jkuo65cjm9grYU+mDsXuv8+
         NIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784737542; x=1785342342;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dgKunBaD1dP/eqVy3A0wkDQ4Mi805hagXOXzddL7tw8=;
        b=Nr8m+QQnyj9DW4MyslapgjP434Bm7d6k8nH48J3/1zVCgczZJSoWiINHg/KvAoMBFl
         mspw029RV1B4YuaHpGRtOcrPnMZ7RTxm3X0D4QRhjWuQ6tq8kqbi3JX+B/UKEe8A4BdV
         0e4Oj+q7H5fajcvpCZWSn9z3UcGj1cmp/j0nn6gwAQpY4MJafzbPpT7YaRpoZwQ/fa69
         5jR7YGgylE+7DkXWZCO8f5u+q8YKGnlNKChggK9ZHGWLlYq5Sw0Pvq8JtJ85B1Fq3tHH
         Ih8MnJVnke8Sk0ZloQTux7Vb5JjKGI7/CTfX77ve+PPubPLKN6eXiOYEuwMrytEeiOk3
         F4rw==
X-Forwarded-Encrypted: i=1; AHgh+RoUlkzTCYTV48VVqSH76Pq+dHkUv3way66+J2PcQcoTRbp5XzQPmee1X4ZTsNwRoR0Dmt1HRP2ZzVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QyM5ceCO74QBLYIqjuDzJbC5SfY3OB3MDOYUSrKFyfa9oTqU
	cKSvNv6tLBh/vZTN6QYXKq83z8WkjgiWDxx8Gqi/kfNI8ZmlwlJTn8Z7g7WDiMgc6CDYFZNAzrk
	XKvNeGQtkW57CLcFkstF/ekYnQFXkOm6UQUeCkLstAQ==
X-Gm-Gg: AR+sD11t8Oy4HmK53V4EaYneY2xIQqunJWUJPjagU0Uf2PH8rYODl1qhkr1ZX48mgmZ
	+7BFwbpdX8G71CF/AsT1JjoEm1ugNgv+WuqfoKO1B1l+uEsusz3sJvu2T/LdGeSGrMi4Ur5Z9qd
	lzYLnXjFsCqm9TQWpmlK4eOMIILieWkxZp5WoLEQqYeOTZx7pSxnfE2kiPgFQWLnsIJVbRz4ttL
	Ul8kxb1QlTO7XOJSPmyy4zSt+gSdfLuUpw5bWdWdRIidoCJh6bBk86TKkYnIpJUTjctwz6WY2s1
	GhsvxbkN4y4u4S9a7wmiQFjhn93n5/C/KwVZpR9ooZgS7qoXZKU18tdZGzzh12gSpPfpfbZq
X-Received: by 2002:a05:6402:5246:b0:69c:794d:48b2 with SMTP id
 4fb4d7f45d1cf-69f34de1ebfmr2029092a12.15.1784737542029; Wed, 22 Jul 2026
 09:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721202201.27442-1-mtormento80@gmail.com> <amDplMXaf1JpxE0v@kuha>
In-Reply-To: <amDplMXaf1JpxE0v@kuha>
From: Marco Tormento <mtormento80@gmail.com>
Date: Wed, 22 Jul 2026 18:25:30 +0200
X-Gm-Features: AUfX_mxRdjzLFcEnb5u-Gb5gfyUaQouHa8kUyovlIFmAgoh479NMDjKj_L0rLAQ
Message-ID: <CACF_UwoqtaGMB=O2em92JcTnW1RP_ozD415ieAbMBgmmq+gG6w@mail.gmail.com>
Subject: Re: [PATCH] usb: core: deattach child device from typec connector on
 port unbind
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 18:02, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> There is already a fix for this:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=e0b291fe117964037e0ba382eff4bb365d531c3a

Sorry, I did not notice it.
Shouldn't the typec deattach come before the sysfs removals though,
reversing what happens in connector_bind?

Regards,
Marco
