Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC62386C08
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 23:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783640490; cv=pass; b=f40gm65uZHKt2IuUmAHItm8+mPtUdJD14XqBIN3B6g35GdppKsHHrS7s7q/cnXQ9oL6pMq/yVb+FTBIb4WobxkUOZsYhFovfvnQqhT3K1GrLyN9NWh4cSrkuC/FbITmm2Tic027AiUNIGB1gHkeamDtGWTMdq2JqNYkFWJr4irk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783640490; c=relaxed/simple;
	bh=0M+MWpkb8KA7+CkCuAdlETVLZhLgxBS9pCa1JE5CWSE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZIfjnpPTGke+RN7qezx8rzJ0GoQggkYcAnFffke0tX7Dct+18VCbj7EjGx9bz4esTfjGP1NLesCqHjIvLfdf+O0/cC84kojoORnHrmHjHlwRexe9uADWkXeNNp53bY/2RkvE0oh++krz8mkde/eQkSKmqlmD/h70UAXnI88vjx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKraRAU7; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKraRAU7"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ee88fce572so4251646d6.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 16:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783640488; cv=none;
        d=google.com; s=arc-20260327;
        b=dIEgfsC51iJqT/X56ZCeZLCtYTxZ29KbUpF9gYrqukYJCBecenjWAy/OiEJ94JiLG3
         rlC8WoToKpZEjnolf75ms38Sf1DhTKyxg9NQV4gNlSb/BAHkO9aDqxdAhO27nqfbJJIj
         0LGFNBwimA+eFLikUmyyBC2uUBNu+kM/F9yAVAr7HqPGqaQG0+Aomoyq7nWASfmsMvu4
         p5mFxQDcrIthkRM/ZYPoojPGZnZ3hR9Z9LNVKRjIo9uw1F7xEW8NbVSFsuQx2qjUSalE
         O/GPIGW736Y9frooXe4fR3LRyMtmjFk26qwSjf8O9eKneUf+dnZpsZSm4s5B/dU7kuLb
         1X8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0M+MWpkb8KA7+CkCuAdlETVLZhLgxBS9pCa1JE5CWSE=;
        fh=/Pqkymbn3L6gd7Xvr+By665YfZn51FeQ3aYK9lsoQkU=;
        b=E5DH23+kpauWK+e9cZRQrvDt2X3qsLeggOJ9UnccfC8EA3gS+pl2z0eIiyBfCK7a4Q
         7Jv4RDcPKf4j7PpnzVA5cE0t7dNB9eNdJx8adey3lBiREKi5lHXahvDYeAScqNHqVjc5
         Wl/eLYp0T8cR1Uam8BpEkN1ecMXCb9vsHDC/EDIZ5H2CaJPybGoP80xiJTZ6oCi4paCr
         bllFrVDu3vIWkAEdFG9kCII3vgMu4Nsk0o2ajxh/08zEtaYREgHNkBwZcECrKDGzLe59
         xZvxGIVrjCtyoTRbUtss6cJa9HEieQiDi+C/bW/2g8i0fHJn6ggGvhC8f3SijlV4Jrkr
         Ce5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783640488; x=1784245288; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0M+MWpkb8KA7+CkCuAdlETVLZhLgxBS9pCa1JE5CWSE=;
        b=TKraRAU73zBa5ppw8NutLbpuYUg6KaoyXRs4q0CE7hL1CDR2x6yGq1zF0RTetQnCci
         kvuXZbsxWaNEymvQtPtR9kKanmZPR06fZp/G4ewlBL5Nd3fyWAa89+ci56LzYblJhbTM
         5XfvO10X/oTLLOxkonS5Bvshx+bFgnvfXJtHgcmHmHooRfjlD1L8nBKSlp7U4AQ3P+F3
         weNu4YuCc+e73IJJft/x9RTnweyn563hXUcdK3jaTPVaxt3j4mQdYMb8tqzuImKTS8b1
         hn/vdgBmCOjwyWK0EMBC5lHE0502AilT8hxe6AsFxh4APOhpcRPoTHKLV4YTXbr6uEMD
         L9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783640488; x=1784245288;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0M+MWpkb8KA7+CkCuAdlETVLZhLgxBS9pCa1JE5CWSE=;
        b=FVkTbDTQFOsstaAzpA72ikcApRadeyBOorD/CodJlsHZm14OPZ1dPBqnRWFtLdGq+D
         ANt0gDmgiNRARlIBZeGcEZvplzZKyc1Kqk/Zdscg3eNH2uOW0ssxZo45tTRuhqTnb/0R
         USXmN8n7o6stCXMmw6ZBEqVesEgMPqhqatERejPRM0l6Gn0Q1bBdWyxXVZs1PIvUdg8i
         cwEi6YF6hDFpPXi5/xNIHV/w1RNIcheHnDtpIq8E2GpcuNububVIfjDu3WBxdjNYD3gY
         Wc7O4+ODnE5P6DybkhwhU2VF32pGdsQXzW0h153YTf1TmaVis+T+JT5woQBn8a7JhVWL
         hF3w==
X-Forwarded-Encrypted: i=1; AHgh+RoTh5GguqNeOWNW1BA2Q7w/bAbbajBurxmPZ6JPM0mSJTnSNP+AKoRTB4q8KELGECRkSE3a0hruv38=@vger.kernel.org
X-Gm-Message-State: AOJu0YymSZK/RfKZqKTyULfkZrENhyHc+dEQKbgOCnj8VKTVW7Z4DF8+
	7JD9/F1gbHhozBD92H0Maq55UV4PT8C7O54l3FLJD3sZTUQygpxFmLrZYEVjMN+qCyUg1iDBMtV
	P4osKLxhltxC63aNGfL6L4PRscuJkqxI=
X-Gm-Gg: AfdE7cktXKZOZJPH4fHddZfuIv5oi9LdjUKuJPeyYQY36XhyQKLPzPl7dhfrEAoYiVm
	mGgbL6+90cVab1JR2JOB0znrT4N0dwSoa24/tRY2h/k/aow6cFjGdOQtBkhMaocjsR3FawIkwiN
	exxsYqNI48n5AGqXS5FLdpZejZtQI8sR9yM8tjydF4KWjZOO+FkzmDVSk4q4Mo6YXQdCMdY8AKl
	QYXbeW6MdxDJWPWfbBquPgsbdndhAN3MIRZVh5GjkQfamSutGqbJuA53oqRkOcIczzAD2trhjvA
	c73p7HkE3rUUPIxwv/GuYAbbD4ECbA==
X-Received: by 2002:ac8:6f15:0:b0:51c:7b12:120f with SMTP id
 d75a77b69052e-51c8b4daf00mr115970811cf.77.1783640488310; Thu, 09 Jul 2026
 16:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Keshav Verma <iganschel@gmail.com>
Date: Fri, 10 Jul 2026 05:11:16 +0530
X-Gm-Features: AVVi8Ccq0VyvREcW_D7rSUhcP7l_Hk1nroWYC8CHJXgdYbv7lBBv6YP3lDd5ayI
Message-ID: <CAPE_3zK=BneOTJUXnpTXxt5_Gna_xy0f0o+gsTG9+twxckc7yQ@mail.gmail.com>
Subject: Stale maintainer information in cypress_cy7c63 driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, johan@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

I was looking at drivers/usb/misc/cypress_cy7c63.c and noticed that
the maintainer information appears to be stale. The original author's
contact information in the source comments was changed in commit
d09d6a351498fcd6195f05c3964320ae6fbeadb1, but the MAINTAINERS entry
still points to the old email address, which causes emails to bounce.

I was wondering if the MAINTAINERS entry should be updated.

Thanks,
Keshav Verma
