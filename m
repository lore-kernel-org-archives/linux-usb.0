Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED24E4A99D7
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151357; cv=pass; b=q8bthsJwcxjqmOGGxpZGT7kBcRw7YXRCRtocT+Tqha2pBbB3u1zrhjBr5iY3xqxlj3IfpORz+z9HaQFv9OkNF54tchmsnyvOa028tVCzKChIRjrCiJaSg9LYSY2v+yyGqUkHnUgd2UXPlDL3cSb1N09ZNnT5HZu2eqYVdzLg3Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151357; c=relaxed/simple;
	bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsm/tDQI4bI1YvOgMEHicb7TIASLqly5roNqeoew7qgmtkQZBHUzWocQ94RE00+4DhFeXn2CXoTi2F4VmtnryZSsaD04MTBYOobqMqhL7VnFTXUERdiJycVVF8yx4oDP/xP/hz5UX5VcfoT1WJYnWXk2zf6ik4tBkRbOLwXO9hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EET1zZxh; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EET1zZxh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e6ba045ceso569085e9.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 11:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789151354; cv=none;
        d=google.com; s=arc-20260327;
        b=bEXlsHgBxvRpifaWOPqBFNQRNNTp1cd0bjpWm0lnv+ZHqzW2/u14VkL6Xt78Lu1qNr
         y3coOHjO4QQv2iLFJZSbpjORXwxuHkt5lRTeJ/uG5Q6+omx3aErwFnsvhHP5D3YwDGez
         fCBKnnNYTCLShKJXoxmIkRwTFACpO/HBXfs+qbRDQF88RItk1XdvCpi34fsRgLSK8W4o
         48qHJhn49gJAdrwoRVV807VgVRW9IMGLs18s/0KKeoPVX7l26rpPx8CeLwIBZqp0b8/+
         f+xdMy/qxRR5NF/DbXl4AG9ltoaf8Yh/RIp5LrR9ojPHHN6vztbKKi71CCA6QTBQGko5
         FB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
        fh=Vmbppep52wGKEBq0GS7hzycW0EEYj5gZdIr7a/Goa3c=;
        b=SLkHzdPPjmO6UafW2dmhhhDObZ2+5bNGwseyzmfwzeVO7OZyZJnGitzMIvbHViIsf+
         +pWH3ocHAwK2IV0QvKAoDrg/+jOYNq2oQWnlNg6FgMDHYk6ixRsdEXFERTP4lVUeChEE
         Ei1jzZicPOD+H+ByJhP3PPAp5SIeyrriUSEv2GbVukzw0qBBtmZ40aRhsfA/ytCSYAgr
         Blw3Y9Jpqj8/pbEcH3/BSDV9RVojIQv7pLq92NqHUFq0bx9/D15CR2lklVqrqu8vU91o
         1uoEXxnMr7SctvhgB3c49VSQgRSC1l2imMR0cyV6bE30vCsuC1WM8TZkAK7rIam4HiFY
         yq+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151354; x=1789756154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
        b=EET1zZxhcmInoFLGZImpDYoGbOqm6A4K9GVlZZEbMGMHaYQjga1GH9r3gwoUDGE2P4
         ZuQ73LPR+izkLhNWdEkfG57X0G8N0QG6qQPne3yW4bbctsd96xJfc0g0DakQ9fpuK6qG
         rfiUFb8GAkGOjPTPCFSMZKE7Kw+cR0bsOqGCsF3vwZd3mHnFCRlJgRAE+9JbgKAJJvB4
         vuU52tM2GuHgSnSQdUuhHfagcPAz1TSxhoftPkN9kIhyo2nHsxRPXhufzDObzNcL5juW
         6HxGRRw0mr89H7QxAyTp1Ev/j6hwV6x9AlzrK8+PMVvKqlkFplX8QltSwjSZysTGHiuR
         1pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151354; x=1789756154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9UEJ51Q/7A2xK5RfquhTtGt78CDG/5WScCm8bqPpD8=;
        b=kLBwk5irk41SRGV1gZxg7jITLxTFI7j8h27Z1igFwmUFfuo3TRqt8twQm6S57ZSrHN
         4Ibci5AfZYmbWjIqaUYu2d5H2OXEJsUrUGHDKRaD+CTZaVMRZnNXAj+Je5JX4tGWbuNl
         omuSz9ykcj2v8hEVmSH24I+jVgt2EXgzeLhQMYZ7VnND1R7ORCKyax7IgxLRHfseJ0nO
         XlTvhCJ+nBHiFy7FQ9GDF5jF8l5UHwBOZx1Ng+lekTuBhVspE5xauvkTHgiDlL0ydKOc
         o1tiiy9AvZw+4cZnzZlXXshCum+zgGD1s9HLztVdeZ8w17OXwVeVqg+i9mjhfqx3pQ9u
         b9UQ==
X-Gm-Message-State: AFuF++lrAyrb475CLCyYQ4YEshEZAgVZL7Aw0gnBEIHXFs2l/qRD4WKq
	A2FsIxKhXiLpqxEwiiydXMiXZaE5wU1kTgWAVOfIKck+QauHwOY/HMofhYJH/8xPeIMrvh4oBIK
	m+BvhkR8QIWLoiRHm0T67liHi2+1NA4Ook9TaFcgA
X-Gm-Gg: AYBFou1kPx+PdAYbUX0WAO+KxIv8HyPUkGR83NIp4cguEU7VrxXR88hSrK7YQK7xie2
	jTPtsRNRCOYB6hFOkA3thbKu8Nu/zmV3Yp+dwtqJqXTZUiartAcULtrPFQmzUdXpjovBQBBengE
	gGv0Q3QCCyAmM9u6IRDa3RqQn0Meo6lBqjBH2cmjb1OEicZE/ANmNEf2ZMJ6bEnC69V4p7Zmxs6
	5TBjflKF9EBaHZAZR5SyRJdKdlBFKwVE5vov7bmBKLn40R9yv5IjuqtrQi3wjSMuHT7GVYMyVud
	58S119Oxu8us/dtDof33B3k8IjB2k0heMcUNhb0b5/czdpEg7GhiteSPiW7ysXibq7zCiiB/nb6
	AX3vR4MCZgA==
X-Received: by 2002:a05:600c:1c10:b0:49c:fc6c:be05 with SMTP id
 5b1f17b1804b1-49e619f7187mr75881355e9.28.1789151353638; Fri, 11 Sep 2026
 11:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910233553.3477055-1-jthies@google.com> <aqQCzNp9e6JfozyO@black.igk.intel.com>
In-Reply-To: <aqQCzNp9e6JfozyO@black.igk.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Fri, 11 Sep 2026 11:29:01 -0700
X-Gm-Features: AcwNN1UmvAfXnMC2eFhkRALhuyKuEqgO9X_kgve427KCOZq2yvHQpgc8_cZnO00
Message-ID: <CAMFSARc9XQ0BDADK0hV72GJrjee7OV1=wo2mVsZipoa4F46Diw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Cleanup UCSI DisplayPort OOB fix
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 6:32=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:

> I don't think this is necessary.

Hi Heikki, thanks for taking a look. Mentioned on the original thread,
I'll send a fixup patch to make these changes.
