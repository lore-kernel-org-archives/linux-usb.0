Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6433DB337
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839448; cv=pass; b=ClyYRCOe+vbhoK2c4FL1I0L5K/SGCZWnicUfBEg9flj5azx59Lq2bEUG1j3oK6IxnQIefN1hBAeUSYgj0P5UTuEqcCUAxr4ewVbo1G5g4Eo8CZ2lYPXjDVLSQp/+7EuiLw3rbx5z2v90OVUzRioeCQezEBi/ivWxsyNXoLQEM7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839448; c=relaxed/simple;
	bh=Q+NKeElSU3Mey9uyDYNttOsH+dbdUz4bwovoPjDwSTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngYltj5o1M4vJwScuz9+dk6aBR5MVBDpdgXZjqTtQ7pTvGIR1+jzB3Df4zQwynPExabByYKSrknIFSTTd/DNGcfny/FRUIZtcD6XpHRuoSxX+RHQyvC946pPcW4YGT2QLwpe60MbRCc/X0+esqyPFwfiV88FPbQhMAl9Hh9aZP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD0UN9K0; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD0UN9K0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c0e124d2a21so570513066b.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 10:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782839446; cv=none;
        d=google.com; s=arc-20260327;
        b=J12Dtm7dp56/K70uL2BSD1hUHWJpVd2wLoyPYBQqRLFdPWH3LLqzOJXc2U9bKxHaKU
         lNANuPzy0Z2zWgi4d7BsaCtMP9gavkWiGY86ujSngnSkjWz9ZxfcXN6pKUZKK4WTJ3uX
         tzmixfQOGKxAnHB/js6Ub4pSETWiGliz2vEiAToCIrj4QllfWbG0Vjhp8FrK1BZb+Jp0
         UAdM9XDf4SypFWrHvBTEijfaljKz41j4pJtYI0cvSXdrKa1XFYl7mlyAdRB36HR4qa3P
         9eiXUQjCVjrzuZe7RPPy/+vZLyb5esbgrL6Q3vDJfEUxZR5FWZSyAFeAMOW83vQVxqQn
         PYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=64A1s13t8IpGGSBhMh8O8eYrTFpABwP1rR+WIQ9DsoI=;
        fh=hdZOCONepw+h9w/67dNx3sEzuiO9CszR+6LCndmuuLA=;
        b=Qio1+GER9K5Djg1liKTR2xij/hVexbqbJU5momZ5QG2NN/3V65nl78FlYChfiI675U
         7xcsw4QRpH/YCYiJr96oTF/m6SSpn3UXpa6epin+PFWSkSss6ow7Xs2LaYbcNzef3s7v
         qX2x7uN5KcF5Qca9GNgWcoY/hFsblmdaQUDDz13EJePbZFbfGIif9/8Rl9byMs1N1duI
         r3BqwY62S8C/tCGvijE0u1RCT3Al2bVe0EqF+MjqkshxjA1Ny9FFoZZoWcFWBRxpZvWz
         ALi12RAy6voQQQ7vPCkmZbFR81u7Ppo9fCOaBnDafe6w5SKG8Issxl7+0IpKpdczKuaQ
         ptNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782839446; x=1783444246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=64A1s13t8IpGGSBhMh8O8eYrTFpABwP1rR+WIQ9DsoI=;
        b=aD0UN9K0I2je6VboJYEwgYK/1RyEHdtZCobpZKj1h227f+0T94gqS5Uu2Z6SxTLT/s
         PFX1n5ScwuxOhL0q5YiTfGIy4PjNbSi9lZr348jFAwbRvO/KMTTe6v7VVTYV1YUbm9UG
         Lj1gnmQyJjV2zBkY2fbKjQg6ZDVv3KA6l/fukd/sHKRYMV/Kn9yXshmkW9JgiYpb2+/i
         ZlA3uU/nxcw7IDniepvYdidEtkgqB1m5UNzSZ9uN7hYKpuccCybt0uRnSSMUdf6iTlHE
         sOrbJLR3YtoaZNa/jBiDHXnf8Mw1x9VumT1EU+4EofBM+/J9/kDQt3PDhtgvHDr2KAiA
         m2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839446; x=1783444246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64A1s13t8IpGGSBhMh8O8eYrTFpABwP1rR+WIQ9DsoI=;
        b=GX/aRu8q5CP3EAYfFOO6j7gmG0rPu76OoHsQeLmAHmeGk/lYsrvMMWiNVinR7NeuAX
         rbd7heaXssAjX+ESLquWG9mIExtDn5DN2y0Xk+TCHo1GOFaSZaX74aXzpSKJV8XyKcl9
         Rnpk1cMtZvW4+LrqUhs7krAdinhs4q2Kt79fQiY64/UbIW5ADCgu1J8LAuK9+w4DsO9e
         W6FKUIhxC8Yq66rdQzroZonM5EZScW7KI/uSW7705bg2DUexJOcGdxDcCxd26Ri8Gl6q
         XKljPS0Y/XvzaDupKpQQew9cTUnqy/O+KdCZWTE8e5L3YvC87PUlZLyN3RYi27MoDHdI
         E8JQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXVd9lp+GxoJjdlJ2X0lh17YQ9FXOGUAAXO6vPzelHBl/wseBeNtXun4TQFSVi6y8QDDyMlh3xt5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0yuc2+ekeoBxnL+ql0QejiHR+ubRZvHzx3pNhExG/9oYI4spE
	L07ql2z+HjwF4ERgSuz36qHnNC9kXjID61uVYiRD7SmrG/ub7aZb2jLf5q7VMojFHu/ix9rF6ab
	986fp2Rpfm1BjqtgZunyZmqVFooEVW90=
X-Gm-Gg: AfdE7cm4IZ6RaILkW0F61lJXn42STRemozsRgAGQDVsS+X2nYnjiCBCFR3Rh9AtnBYq
	/avnDe4eoHgeo3HanA2u0uX8Xjuc025Q/+Zy3fZLlbLIVz9aKis7/oSCvXQ5mQTZYoBzhe9covq
	sCgB/duhlDYVsD1O99yatTCtaaLGd50yvjKfGWujyp23SQZdUDzgoA/pz1xc/HgEonhdotLwoVd
	sKRMaa9Al3Qm1ErVlvV4yakgSrG0jxyQeh9aU74S6oq7XMzMuzh3k/eZqndYzp6nNx9do7qJYMQ
	XN6QYbTWRYKesoJMYPdvez0+f4S158k=
X-Received: by 2002:a17:906:6a84:b0:c12:8296:1a76 with SMTP id
 a640c23a62f3a-c12872d6ec8mr174161766b.33.1782839445331; Tue, 30 Jun 2026
 10:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <20260628231634.6752f74d.michal.pecio@gmail.com> <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
 <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu>
In-Reply-To: <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Tue, 30 Jun 2026 22:40:33 +0530
X-Gm-Features: AVVi8CfKnnvidb5guFAdpaAe6CVJqAOJJ5DDmKL1Krrb-F8QVvOrevg30QCfF0c
Message-ID: <CAFgddhLeQ1cJv-E4mYWR8cs7T2USkrEd5i=uxqkNCH2UWaQ5=g@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> There's nothing wrong with trusting the caller to do the right thing.
> Besides, if a segfault does occur then it will be pretty obvious that
> the caller needs to be fixed.
>
> What would you do if buf is NULL?  Return an error code?  That won't
> help anyone locate the bug.  Put an error message in the log?  Segfaults
> are much more visible.

Understood. I guess my coding style is a little "too paranoid" and
"check everything and report errors". I understood now why this may
not always be the best approach in low level programming like kernel
development.

Anyways, I have done all the requested changes. Here's a short summary:
- put strings in a single line
- copy bytes from desc to bigbuffer instead of pointer aliasing. (so
no krealloc too)
- change tabs to spaces in documentation
- reworded some comments
- drop USB_CONFIG_WINDOWS_REQ_SIZE macro
- revert USB_DELAY_INIT to original behavior. no delay before 1st request.

Let me know if I missed any changes mentioned in previous discussions
(or misunderstood and made unnecessary changes :') ).

> I wonder if it wouldn't make sense to split announce_device() so that
> the first line is printed as soon as usb_new_device() starts, before
> enumeration is attempted and possibly fails.

The current patch still logs device ids upon failure in
usb_enumerate_device(). Do you want me to implement that suggestion?

Thanks,
Nikhil Solanke
