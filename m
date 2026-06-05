Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648804183A7
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651057; cv=none; b=Fd8cnS8bd2POItTL+9YvkRjZOvZ6hB/yrSA72oqFfslsXGDsS/igIapfEUjASatzSqz4VbbsToBaIIl6WsVLPmP8kX2TBAq4CzsC8Zg98DNqmdif+863w+eXBbguNE6QLFfGLSJztRYEHBDTG26Tp9RpETLNh8IW9r7exYSoe5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651057; c=relaxed/simple;
	bh=YyVXKCThFOZpolJsPAauYC4PqDv/RwoqFWgGMQRXTyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9uXXsiKRDdBUE8LbLvXLUyN3C5IimwEKGubbRHSrGZYlx2sdeXA5MZnB7vpwTbpGM5+CNr862wFT1c2QjdXOGKi2RBzvjkmc3FuDwWaMeqYL2oJLl5SGpp8JJar/PeHGTR0bAl71yXw1HzwztupvsKus+qXK55jez6hgpEIo1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S04ggsDD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S04ggsDD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b12270b3so10187735e9.1
        for <linux-usb@vger.kernel.org>; Fri, 05 Jun 2026 02:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780651055; x=1781255855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2Bl3kEy3Kn3eFNYjBbD5PVQ+fLvGRuPejkzKjLVEKA=;
        b=S04ggsDDJqCaUSd5Qarl2qqyrMPDZWC4I/f91lEoiXAD0/ZsJToLSLLIMNvHO3JFtS
         GbUdbIF7KuYqoW9VEtUYskqrApS9ncgLP4FChHud7zkdPjKgbsPOCMcHnivczaFVVsPZ
         Wu/8jYNmLZidSpj85q5O8vR71BK3UNCR7nt6WVOqpF24wnCCIuHFRzzDPffbBxO8LGJd
         rblFkjuZkF+2dPDKR7+FN/KoGcyd0cq6JIoy+VhEztko740cky85xp39I1f3+RMtN3IL
         J53lum/d8BPYgDAVeUYHpmBdo1jmHqI0M1fokvW0QO0tzVJFTw727G8KDVkB8uppPtTs
         Qvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780651055; x=1781255855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G2Bl3kEy3Kn3eFNYjBbD5PVQ+fLvGRuPejkzKjLVEKA=;
        b=CgqTA/Lec3Jv0LsiYpg20YkcXn4kvkcK6DROU9N1VwuFxq9VzCfoFZ94l6CAa6Eym4
         gnhvyjw415ekY/0cdniYCtJSMmYm1XhCkNnFFwYFgMvrJrE5PYiioeM3bHKlXzUePdVG
         NePu2yWdCpgM0UbuqCnHl2CckFyvQe/eG0qYebyEjPZc7JW9Cu1Xg11ziqHpDLs5TsUv
         5ShWyAriBsaPyfNVvVrKN/COz923QG4ScYpQhr2Wi5ZnJH4AymwiyVn1FrWqCTUA4PMH
         sDnUC7rMOJAV9eKOBvpNITsZ72tXBEETcY/EdRgohs9Yy13AZ+SI1jdY/Q5hYmjA7SGb
         oZ6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/BRtvl+7r7UoYaOfHxNEKhwvmqdSTCyzNHpIYd/IvEwqsTdp64f4y+Oo5A2J6fwRl5uy6dQhbNUIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BWqihzbi7s4WdWSCgwhEa9ZsOSJWsIwn3td7cQyu1CzkzM6W
	mHWRJYKM59cxqCEt0c+klABzTPiGgr0+xkDOPC3JhA8YpXrkz2eaa+90
X-Gm-Gg: Acq92OEOF294c432ohHYSM2emvFhHUqGyhdJ9W5E2DjSjrggx5wvE6q6fap+oWX6UNl
	2g8poaRg3lpKL5ZBUL7WQpYe+MgxwE6aduYRyhhayYAxUpZTd/aYkVEw0Aa1G4fzQdg8Ya8pYCl
	IbM6NLn108E9C5x07NXaqmjuoDF2Ultqu+yYbxgQUyyK9fa9JSV/QUOA0quv1QE2C2uccwxWBhp
	C8GGTUKBYjoqzoTReocgihV25QCkEpVaq7ZWXkNYq1LpITjomshmrapGv++KVIygV7AGt49g6Cr
	PWHM5BR8uP6y9twSBkj3l6/ano4eoCvxvFpsrMo3N+qkermKraTduhwYh90sXx9CchGxC8UZ3pZ
	TaUU37nFH68lZpNni6d8yZ+fxU3WJ8hy9PSxwS2YyBEUYlGY+0p1o6rv4wMUthZLSNkV3hMmILK
	W9sXo0ioAVq5qFqb7zLmJt0abONRzaYXm13e/QowhzRw==
X-Received: by 2002:a05:600c:3e0d:b0:490:a1dc:e542 with SMTP id 5b1f17b1804b1-490c25afe6bmr40286715e9.6.1780651054791;
        Fri, 05 Jun 2026 02:17:34 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d6c65sm136948875e9.12.2026.06.05.02.17.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jun 2026 02:17:34 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:17:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] core: usb: ratelimit cabling message
Message-ID: <20260605111731.4df19fd9.michal.pecio@gmail.com>
In-Reply-To: <20260605090110.1514785-1-oneukum@suse.com>
References: <20260605090110.1514785-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  5 Jun 2026 11:00:58 +0200, Oliver Neukum wrote:
> If a cable is bad, it stays bad. There is no need to flood
> the log with messages about it. So go for a ratelimited
> version.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa9..5262e11c12cd 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3148,7 +3148,7 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
>  		delay = HUB_LONG_RESET_TIME;
>  	}
>  
> -	dev_err(&port_dev->dev, "Cannot enable. Maybe the USB cable is bad?\n");
> +	dev_err_ratelimited(&port_dev->dev, "Cannot enable. Maybe the USB cable is bad?\n");

What causes hub_port_reset() to fail repeatedly enough for this
to become a flood? Is there no bug to be fixed there?

IME this message doesn't show more often than all the other noise
from failing enumeration.

>  
>  done:
>  	if (status == 0) {
> -- 
> 2.54.0
> 
