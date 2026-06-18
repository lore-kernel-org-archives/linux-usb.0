Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597B03FC5BB
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796172; cv=none; b=h/PoxRT9d3LlL8C1/J4CW1JHusRhw3vZYND0DO8AvwPdwo5YW0LHfbTd7TqKzYjSSQt/XG7sRVqzW+AQMh1O/bhJgsT2Z9s2mNyC9gEbSirMSEieuAgnIG/dPgQhBbtl13LNvEZlu9jAbLfl+Ziu/vJLAOreBuL/GNnOqUYan1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796172; c=relaxed/simple;
	bh=lrmIDnwrSmuBmVtnvyYbsICEkrj+2I4W6qGd/fYZmFo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Z2FmpGBaBtJIZcWq32mRS2DRkznG1x26iipVdLQUCNuvrks+/xWXo8W5yJ030aAWMwn/awvN4Ov4eD50yD6K0i5KsIhM3INcazJ8LRUPwKoAEv7dp9XrBeZ2nDJGdg9mRlT9I0LWD0tPxl4EAeyhOj1NdpZIlF/B6rtUQtd7evU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4bmY+U5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4bmY+U5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8454c5a280aso172169b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781796171; x=1782400971; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nF2QDBXrEsuoeE6NYczU5ic/aYJEpbA+kiz3M56yCHk=;
        b=J4bmY+U53zI3c/nP8kETeuMHQQAtYW+YWd+6qUFM1Wm7lkH7OVohUWBlhpxVJhVUkJ
         T6KonWkLwInUrccFXTOxys75McbIHkMCrTmo2/vKwVKY35ib/wFUP8KgWbXvdm1tSkcZ
         Llu0RPadCSycmjq/ApEYPFeXuZMQi73qNLBuvcect9NQOhznku0RB4OwTBsK1yI8kpja
         e0owSZd2KjaQ950xhfiNbY4FVzcb//L5v8t81J3frUiiVVQ9n/Rzhy51vEyuFJq++ggM
         ss5ll7lhoJxatmGO9da0gqg3bB6CnLn74QMsWNpvx8TVwspkCEl5TtQXtyi0RV7LlV1Y
         nXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781796171; x=1782400971;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nF2QDBXrEsuoeE6NYczU5ic/aYJEpbA+kiz3M56yCHk=;
        b=NXePvTVVZdqWOTV2EKVjrQMKJL1zb9qelCwOkQJL2dSHi8KabwTaj16r5Jju2a4rFH
         olir1GHWN3cFlyWQht1nLIufOMsUMLZXylf2GJPHxZKoPRtTopeCbBPZNdTt8Q/XCMyH
         aF5zRKloJ3qpMysoSHROPRYbcAKiIU8wmSx3mZzWq+uIBSjdFzqopHsJCsKfwvDXvWq/
         9rxfJ8tEN2440vtDaeRLr9senMaIGxv8orcxKmkA5UwM2q4IieaiGlsjxACfm2l58JVy
         wphw4ypZ82FmaJYfzlDSE3AIK0/UZA5fZMWudFeTx3baRcABsYDdFnYoUh6kPcs5x7x0
         tMyg==
X-Forwarded-Encrypted: i=1; AFNElJ+3Y2y5rcj3cqOJOuHT4/JKzcNnQ2gvnDYKjTahrbrFp3xqms5QZdqYbz83lnt8VGWCCjqIFuE8wp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpc6CTDWJBlUmBqxa3sMespqzgrPqdlMafExJqJuYJoYrdiZJ
	aSY9uKG1u7eRzM4XpUmjQbiOSgX1NTcH8K7fJEMytyVxP6Keg8dSAJTX
X-Gm-Gg: AfdE7cl4fhJGGm8yZroGiYy7AyOx1sGjANRDFdFZ2GEFF6NRnGnYaxUyEFjugoEDcyl
	mkNGngbUgucJ+o4uAo1c5FJXCnNkrXpsk3XvlWI5Ewa7kk9eXt6RAx4hNtR3a+tLCcGLPermgPn
	w2dmasBrP4vieAFtApQRrC1j28t6S9QG1yvNCchFsBMkVqAg/h1R0Wpp7p6jYEWjHRSzGLOOUEI
	KMmEWau/KsajE29wBUGLmqa7XuzQ1+mjiM7yrljn8ihujXk1/LAOt3afg7L40i9lyVzQqYSfpMv
	sipsBuWg5+OXtJF1EgBvvrarkj9hb5lT25OJn5jxx5GT3KY6f0xgB4xKvkoYH7QJU8jV1Hmr/pM
	tV0RbdeXdYrTqmdlwx1gnahF7cGCzxQ9xNbKLDX9oed5Tb8c3KXlm4lOMv4/O+/B6/JlE1VwI4R
	TFuELtDfF4QSqOOZaID2For4U=
X-Received: by 2002:a05:6a00:2d27:b0:842:4982:82f with SMTP id d2e1a72fcca58-8453918cb80mr4143556b3a.2.1781796170662;
        Thu, 18 Jun 2026 08:22:50 -0700 (PDT)
Received: from [10.188.227.203] ([2408:844c:a00:6006:ce44:869e:4d94:f839])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm19979279b3a.8.2026.06.18.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] usb: ucsi: huawei_gaokun: move typec_altmode off stack
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Duoming Zhou <duoming@zju.edu.cn>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260618143341.1900221-1-arnd@kernel.org>
References: <20260618143341.1900221-1-arnd@kernel.org>
Date: Thu, 18 Jun 2026 23:21:17 +0800
Message-Id: <178179607717.777438.6873312987561958509.b4-review@b4>
X-Mailer: b4 0.15.2

On Thu, 18 Jun 2026 16:33:14 +0200, Arnd Bergmann <arnd@kernel.org> wrote:
> usb: ucsi: huawei_gaokun: move typec_altmode off stack

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

-- 
Best wishes,
Pengyu

