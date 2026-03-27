Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330181F1518
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578564; cv=pass; b=fh9jC9tYpgVKE+thXV8ZCzAViqUTDKJnsqbdNYRpp6d9exdkmW1ZyegDqeo4weFlT7aC1eQRJZAUSrTw+ZrFW2OAYEzWaBpIrN3g/LkAKEi8iNts/Cg0wZQRpnuxhTfyHlOoq1DE41yBWb2gDZ3oGnlYMIuz0xNUhqJ/PV2Ge6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578564; c=relaxed/simple;
	bh=gmWDnc3wwmFbak9v/SMAhii7/p/jTSAc4ccgG/xmhgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXZzTz1JDXRrqYTDei1wiXDa81qxz3hNdiIrut0BZNEEq7vMvk5QWkKwM0bZKCxVf5MPsjS6diU+dVXICbX2syADncc4ToBqdd7QW3yQ6YjwJKkOaiJGkyE0RX+eZNEbCjxxtJyIN4Q74r0sA/8spWhPg9Cbj38T7AVYrgkxGxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX39LVyp; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX39LVyp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso16631625e9.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 19:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774578561; cv=none;
        d=google.com; s=arc-20240605;
        b=hwk8guFJmxHZHmJ06WXPzbTxu9RNVv8ANlxHKkXMAwP7XJ+tFqUlEQqPNU5TVXPogW
         BMgmQHukuEI2Xu3nzAl71yyD+Fi4iutfclrwqKKEbhbm0G4o+3L1lL4umKd63SUqN2o9
         t/hpzcUOeE8ks04LOQ7TlLWvtTZysHx0a8sNgrcLUARrAD95P4aBFXChBwNlyJsT/g6T
         c/8/7myYRJ8v4f8HxFbkX1+ULmY5Bv7At1uBqN+MOvl8w/zNLokNs/r7ePxz9chK33ka
         j3GzsHDKspIXkMvlTTH++w8MI1JA104x9h+MF5RaNLk7wa9+grx2XAr69kLyrUxZKrg1
         RiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gmWDnc3wwmFbak9v/SMAhii7/p/jTSAc4ccgG/xmhgU=;
        fh=zcgrmjv5BwK5mupdtSPZYvhU4rmRXMoRF45lT4jyaMw=;
        b=MZ1zi6mxBCPeMpD8pDHHLb3Sob6vzHpp/9d43VNjVwQJkrD2/FAO6xJ3HiebKkrAmu
         YgSPYPy68VBTNLe8OfYsDbrVHeRSxp3RHVOgByhUT/YS+Ma+wFFhmty3H/yhKCZcARaM
         7eY/Z5HCe4B7i2aUIGD+IW4Uf/gd37hGjJ8hdkqcm/0vjK4Wpq9oVa4dbBkjY2x1637i
         dnl0GjQ39ivv/Iofw470w2SQfAcMjj1CM/LYTjDi242koudH+X5zjBi920o/qwj6N4z3
         gAM4KXFqRYB+gGBYWO2rc0PjdXRPpUOu9sxk/BmmI64TMUnfI8moj4sZUHF0Gq1Jdp1J
         8qIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774578561; x=1775183361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gmWDnc3wwmFbak9v/SMAhii7/p/jTSAc4ccgG/xmhgU=;
        b=kX39LVypp9eSQhFRFP4XaHlMaYY023mtx4e5T10GX9va4cC69q81aLuTaa0oI0reWK
         HKj8ijHDaJ0PYTOaZ+63HlzcxlPJwgLLmrCkaNXsy+JODgUnk3DZ6FguEgUXuxpU7KNZ
         9Uj1xJKsDXBgSasHW0IhmlUXsLXWWyKunN1WuFo6zcr2zJrrtu+0j/8uuUMPbttB3bmE
         AGwNdSv+s+EW7NgXfzEeR1+ZXjYgRCRfeh3gjL8fa/iBNdY3E30XhxYz5Ge1pM1sXb3S
         5NSikic6wgeHrexRbFeCP8WUimslRty05hOR05sn7OyHVfd7II5y4iaIAl1LyXdhFrlK
         Q9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578561; x=1775183361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmWDnc3wwmFbak9v/SMAhii7/p/jTSAc4ccgG/xmhgU=;
        b=SBP5YNT+RCqY+p1hZO0BTHtXHDzMypzrYKnGGLhXdyo7MiVNr3YoGxUKKWP8290P+d
         D+h3kYbqIwScYPPigTYMZ1WbEkjsfaedKqccBLAcCiIcl/lXTdY/ArYH2L/ZH77YN0kA
         hA6QuPrAoEs11y/SQmzVAbxnKN9fsAx7TXknu0lTtLHSlWzF2lXZmvI+KBZNiJvU3JuR
         W8W5VQvYBefRFrockXgL0BfEI/iaCZZga/cmrV3WYPGZUzVfqiy1fFdbGTj9HdHl8q25
         Vc7m3H0OyOQKyK8v19i6weepELYgtM0JrUssBQagoOZplLX/0sHrUkjFS0RIqor1VrcW
         We/g==
X-Forwarded-Encrypted: i=1; AJvYcCWsPIheP9lXQMvJ3h5MlD236KNyET7u6i8eowVXZDadC9DAmQS8IyU6/U4SrR1XjSrmj0X7ivaGimA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SuMFUom0rKTc1PbEhpF4GRkDiXu61dj6hf72C+WlU49oClRX
	UqCWqfTrIBkIEVQ/oH9T61TKNsj6Fncb9ceQ4w4ihAQ/ZI4yixzbrdugnFlJfNj7XhyOBl5J/P2
	9q3dNo2gfFKt3V31J/94lvY6bCPYGeamIeVBgC5Q=
X-Gm-Gg: ATEYQzxazjo+XSg3u9Zyv9DjkwdefR24cw5+SwwziU+gVcsgqnIY2ByFuDklUsmdmp/
	Riay75SfuLFvHmi5C0x9p7xCPcxifjlWJLa8g9cLqc8KHgsC9G3kVn4HmmIBDE8U+d49iBUN9xb
	3AI+T3ba9tu4O6ZnUl8wCbZq07quNiyUHFvQN4pitGfK0QSbSmwzgmh5SSvwMlsefJjTwrpDCYW
	qJTAIEmqaEfMh6GWNCIS4LGbNdfFMTWlJdkOjj6QKsJabuo/0VxwQ3sDTOhq6qiBK1r1RiM9qWs
	HHTn1tmu
X-Received: by 2002:a05:600c:4f91:b0:485:3f30:6250 with SMTP id
 5b1f17b1804b1-48727eda62emr10697575e9.20.1774578561296; Thu, 26 Mar 2026
 19:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325120123.1989-1-charlesyeh522@gmail.com> <2026032549-zodiac-navigator-23ac@gregkh>
In-Reply-To: <2026032549-zodiac-navigator-23ac@gregkh>
From: Charles Yeh <charlesyeh522@gmail.com>
Date: Fri, 27 Mar 2026 10:29:10 +0800
X-Gm-Features: AQROBzB_pz0hA6G3vcbdUPVQw-0eFBxJ5xqgsimtlPk7PNSqg63EWHTA12umlzg
Message-ID: <CAAZvQQ4r+5ZGDp=V3k0hU2qUpS7pta2CfmPCf=qSoBU7r4WEsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

> just redo the original patch and send it as a v2 as the documentation describes
> how to do.

Thanks for the guidance.
I have updated the original patch and submitted it as v2 as requested.

Thanks,
Charles.
