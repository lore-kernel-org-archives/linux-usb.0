Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC82395D98
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666562; cv=pass; b=Td4M9Ac8Cg4pFO9tZOqVVrdVIZyMndvWOYdyXZKWRTXybMQgwS+LTB+QoP0whyw21CUoBJE2fH7UL3cZjA11I8yRBJ85vwc1qLrPszMczKduJp1HAkBXZCwz8OXukr0obnNQWvnp2kE5epbC4c81LqOGfwgUnTIv3cHNHvm7F5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666562; c=relaxed/simple;
	bh=VBvOgrikSm/itZZFrHme3Odeoak+kGHOO8XfqLOS94U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEBDSBIaJQRvp7VKyvk0L1H+KjbRjeY1VIf+nSEAs7r8m7th0BpXWHgmYO8jQHTVWtf3U+RBwpYeNrOWL94dqs2gRTkj0KYBBDwdv4m/DRie3ewDgmn6IKeGAfx2/VEWhmDh2HOBWUQ1Sb+7fHJjY1d4whkpox+xY9AiBVJroc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru5nem5h; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru5nem5h"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-53324cfe178so25645051cf.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 00:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666560; cv=none;
        d=google.com; s=arc-20260327;
        b=jsAQZWWG+RyG6pm3wZ5hiKJKIaO+kxtXKbbS3KmhwNLOsVClm8kWE2YPeUYB+lBdzg
         tlxmAOTb83aqs5O+38tmy01tsDMOLaKKn7f/b4qMvMUvH7xgdeb+5TW0UACElEX6dKbz
         3h8GZBHeByZsQfr2m/PYNZIl5p8eDpEruhZ6to9aYGRKaxKlOlWq4fmfy7dFAm8XBFN7
         s2tn2BixemnChIwq3FNYL1V03leWCXT8uOEk3Z/PYvyYiIDHwf/mBHyD8STJWmSCpA1d
         7FxeHeeU4fCNnuY+YOPpqSF1Otc/+DuZfevNKIKqbnlysoPti/raVo7lPUtBkM+Ryg9X
         Cy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VBvOgrikSm/itZZFrHme3Odeoak+kGHOO8XfqLOS94U=;
        fh=ml6YVqtr/eMddLQQfYPoEJgG+syI5PAPYRS6y2O8yZE=;
        b=CS2luezGJ5b2DUtiIx1Puptvt4NUQxJ/0RTYbIIy0LUvdaUSjMMYkasYCmc1KyGRzT
         aWIYuNzFc5wGcj1E0iPeCg7Zw8RPqdFbToJlHAdiMApGzDuSythSdtgSb4efZ9IYcknm
         Wjnud22aF+RsyCuJH95iRUcWF/ceQmlp72wZbX1fGYq5hqAwgCsb3VTTis+mNPNp/PnX
         5Opbu9K79EnVa2knj1MkhCP781uS+BE5R8539KKDnoJ3RdCpGDS1TqgcJ8uy7YNhJmaq
         QsN/g41e8xcil9JNXsxbYeiLxYSEArQgw37ElMsKp8QTKn3R51QOPhVw4VpooUf/XMID
         U6BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666560; x=1791271360; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBvOgrikSm/itZZFrHme3Odeoak+kGHOO8XfqLOS94U=;
        b=Ru5nem5h0kJn6LsRK9zZbO4UzZaZiU6Oc4/kCO9a2Nw63X6zUFZy4mWtzF7TnBBeAa
         eGu4ZuNRlK+feaevaLIyd34fXjfGivjwcvzL2FbKksEAcwHxg+seR5mPA1+cxdryrrUi
         ybX+J19izJJqiTgxsvgch4nynKqwud4oGgbx68EPT0o8mQmXCwsmZFvdbrNAwrxiRKCL
         /JnkGGiAaWTJ7HYbOSu1ojQSVwZyhDVdu+fNeiBIOwjm2Tqrj5vrzhSj81QP6vGY0N+Q
         iBXKWMM8c5W6Ryt6Dj8fUHanlaEiJWqSpIcvJGFnzwuVGW7iiFQ17gUSFYv6LZxKlqrw
         +M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666560; x=1791271360;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VBvOgrikSm/itZZFrHme3Odeoak+kGHOO8XfqLOS94U=;
        b=kYBkgBxfhE2PMobPUhbtEap7r22E6/mPcIxvlry37EnZRG4KEQLLcG9yH3JbGMo+vM
         TsqDgBwoSrSzCIJarqmCrSh1Yua1d4Heuk2KS6x09HBPG4m51ss+I0f3R9F6mn4t5m7d
         Pzry5zcKUH1cCK6C/YwXp3bG+jWzXb9gkOX6CXRtcv+MUK/ksL/IeBLtwtfMY4OA3vpW
         BCzt452+CFQAU/KVyRDOlrRzd/kGS/6Tr1XBrnnCJWNGMyN9K1m0w33p3PzIuIpOz2dG
         3s5yyDf2rXdN2857reBgfB0/4lOTKPAck5n/fN6Cak8JCgpKtMRaOGZva7sZYLzifaOU
         MI/g==
X-Gm-Message-State: AFuF++kIxXc2sDelCwYtyCQipfexAN7m8LD0mKPl7wR+bBTfqJQZx/7S
	2T0aCWoiNgZghg48kUHTWTMhxb8Rj08SNeDDYGBxBKjxjQf5d9nYp56kTzG+tnI4MvC/ufGm7je
	DlDQSx4Uv7S7xlwpaQOKPquob4cALPhxcEEW0hPU=
X-Gm-Gg: AYBFou20Eatp/C2kEPr/pg346+g3Fo30m1zoDynweIVz57S/GuTBAi2BBzb9sMML+k1
	btQI6GY9qIq4RZtTDo3MFfAZ2Gc1q6+D3UnQyadlW50aPk4L6bhArPtlcGnNFzogAXIxLQwHfvn
	ONF2Fk8FW1SP7YNz2A+jS642t92p6Eq7X1qAHfKCAbT91D0Jt0p4ZMwt9a4RkExJwAUURbd4NbQ
	8SDZqHbUwmvs6I186AqGpF0fgcWStC3rotNCXUjcu15ADPXubudtPcQxn7SQ0GqlujteRw4pKb1
	UFNlv+nQwCm3uL32yRDfiQH2/qjsjbySohgHnwM6tgnDxZqxr3ackofU6Qlod+m3j97/1SkGIdE
	F1R874luhJ9mF6uL8fUU/u8aq18xcwbFTYZyV63lbt/T6W8vcpXDGDBi0CixHf0ee2yyewN7E2h
	LeyWymnslgfJDWTg==
X-Received: by 2002:a05:622a:e409:10b0:533:2826:292f with SMTP id
 d75a77b69052e-53328262f48mr126133411cf.7.1790666560113; Tue, 29 Sep 2026
 00:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEOLtbAXRO7zwWMtmVTG4X9az-ifFXtR1XgP0O7dNaCvZGmc5g@mail.gmail.com>
 <arprk1YgN3llMaN7@black.igk.intel.com>
In-Reply-To: <arprk1YgN3llMaN7@black.igk.intel.com>
From: Leo Korotkevich <essacult@gmail.com>
Date: Tue, 29 Sep 2026 10:22:29 +0300
X-Gm-Features: AclHuK-bxMOTVZSrNTYRjMGyzD5Zf-EeGpjOZ0EvYrhsbE-dY4tq4fOzRYcPhW8
Message-ID: <CAEOLtbAKQ22_6Wmn7xDjN7WDNdBxqUaah0JPGU3S6_Gg+7a4Fw@mail.gmail.com>
Subject: Re: ASUS GU605CX: diagnostic guidance for hard freezes and USB-C
 power-state changes
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

Thank you. I haven't tried unloading ucsi_acpi yet. It froze again
overnight on USB-C power through a ThinkPad Thunderbolt 4 dock, with
Performance selected. Keyboard and mouse were unresponsive, and remote
probes stopped receiving replies.

I'll keep this test separate from CPU-idle changes. Are there expected
effects on charging/PD or DisplayPort/USB-C role switching when
unloading it with the dock connected? Is reloading ucsi_acpi enough to
restore normal operation, or would you recommend a reboot?

Thanks,
Leo
