Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34FE3AA4EB
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409684; cv=pass; b=l229y6wJLigu1bVm9HAiMx5KErJ/sqXR/uGWdQi4bPm8g/+3DJUd88kTj9PKwiLCraV6gIAyEU3s3soqohiAvdRePiUNSiGIezg1bqh4+vW+f0rikKsgrbEM8NSdCAfZ57iLx1vHMCeXjD642/cWvGBngdmirgeYusjptfczAz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409684; c=relaxed/simple;
	bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWmYaZO23LcCsAmFeoehsFAVqu/b5vPxX1HeHtDgpz9YtZhZMkUwnt8wOifNbZwNDcwUruRwUPP51s6aqOOMh6H/pNmgegftxuTo5NVDZ9Hu76CQvkRjZDSAXXjtXc1f9cfXQpXPFntMzdiWA/3nhhv2W0iYac8yPeg/5Siw1Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXEATy8n; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXEATy8n"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so1141319241.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 00:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783409682; cv=none;
        d=google.com; s=arc-20260327;
        b=goR7KFXKsOBqmtSdgXEUfa0/Tf162uF5uUrtkHXPrhoL3Tu2RlVljKKibLz879V9c7
         kZWF6C1XAwvv2JdkasgDBLWBWAnN1/4doqtBIhVSg2717X2jbb9wmqGiNLki7rSF5I/Z
         tTxc/ROOyqonI2iyetymKLqnGILeKYWuJrOHBMujcqxqCDdAr7f6MYvMtkLwSMZM2Thw
         wpG9Vig5xnBsjUxLKBFtchzKxebd1LSsDEAkNL+hiGYeGXt6xSFL7xk8w8FUt2JPBiKS
         vco5fq5uPq7iBShgKErd7X7ctsQAC75icvNu3mjhehuiikqGU5Qy+6k7Uoz2mv5X1UGw
         TZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
        fh=9nFM7nCBugp4IIgo2qri5BiV7ZHa9GiXo69kukNLbm0=;
        b=fICfPh/Idva8vV8oikwxO2m0sm0uPB962WYRubQhyymEQx/DFME3kjQ+V7AiSr+eTH
         6vnNAnU/8qxpibPlaMyNYoEeAEj3scn+O20evPSS8m0WyU2TvIgtQ9xXkWihj2FyYf8i
         dNQoGVIku0cQGhh3Y1drZduwT9pqOX7h1gVjRkm+xUkvnbhbTtAd8elk5R82kKQxINHy
         t49E1s+NHivx02W6k5rRIxjjD9XlYshNxnNkCUSTSs2N1yCAxE30MImh8wQCwoJKnBbV
         XKOGWvqr0oAPT5F0HOTdngvHatGeOKCPat0ibJf4b656OjpJvYazAxt3mQng7rIkMzGx
         0CDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783409682; x=1784014482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
        b=WXEATy8n5nmiIkjbUALQJu8NTgAUfw9rkLHmCJ+sqwbx8v43mUf41mGwNqI3ww1eIv
         f+rURbCv130QBmHDJg6KtHqvtxpiRWmAECNO0qYpNmQnrmq38ILD5YBNSz+vdN5+ttP1
         9PkVDAyrgnz0MWaA7+gpjWYPlMjnnGK1IoCEg2a6HCXch+b06GCrh9uQbldo5StNKYnJ
         b4ccr+TNLDhQLkOUCEb7M0RomImvbt3IqFOAuOWVJR0nlUw4diPYgeeQrBWBEdaf+wtb
         BgxK1Sati1M3SOj+cks0BpoJwQEXoK516ESHN7WMana9mTTxjl4qp77/zXMNc5/uglob
         dRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409682; x=1784014482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixAFDcH0BX+esbvriT+kYU+Cp+IIBLvEO9GvXSASNoU=;
        b=hRzqH5hySAcfZ0h4hvEj9I99nCoDHMnoywdP2wLHAsggASnAvVe6ijJcOuSOvTrc4P
         RTISzBbUNJzz5r+nfkjDpYZ/koMvBG+XAIR7Cbp9GjVjoVR+VI7nC7V2k375pexFtF/+
         aqhIlNnlhkzpKteow33tzsWKW6TerLajYAmpo2bY9fbajr1sZC45HZw1IQvBYElTJEiP
         BqZc3U3GZpriUscvR3QxUCbAnKOlI9nAh9U1ho3qdWubQW8AX/Cy2B2e2TucnV151eCo
         VnNonOUjCfLVbwZ1AqSIxONIynNMMSvpyMbK3vO3QK2MhZ4vV0Gts89kdb6XOc3Z4lk3
         cXxA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0kblgl9NFLJA9u6e67/Ei0C68Zhii8kgbG6G7uVQ8TFbKYvwoESjiGvRMIKG9d8+GGUi9h7UkR5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyudGALoAJDS9Te8C7XLuNo1L8gOxNpIN4KyzSO63s13YXZ1N2I
	UmnvGt+MfGsYr5MVMGGyJERzphWbeczpdmADX1Z2t5+IB46jOtEMIiqQSzE0c/UAoVcz4PNbIjH
	M+gP3NxjsauEj9vAHKCdWdmGQIeF1ZV0=
X-Gm-Gg: AfdE7ckKLO7w7Ms/7RFCqeCTiLmlCHKUQD1Ft4drJCeW2tPWSGAOlfdMi1RkB1/xlip
	pOsh40cUS12tHAs9fZugKKwUrTXgFR0i77Cneg2ugr1W9A7Ldd5/fYP64K186eO6UulNEUPizhK
	rmNyOaN+qECVSNFn6riUnMhx+/sdIKaBM6cJi/L4kjRRy1mXAdSHkRCfQNFTTc+YjiSiKVuNNnk
	aduxmjzdN+MTcO/TDKwediUW2bSflaiALLL+qOL5FXrZYHax3TCRFJFQmVdAfkFe2gDPNfBuCUN
	/YjHLtw4dP9NvBATzJQgaR/ZnQHuHBftUDxxYZ+rtPDw4QosMf4U4A==
X-Received: by 2002:a05:6102:3e2a:b0:738:bd0b:7560 with SMTP id
 ada2fe7eead31-744b7deb7cemr2332001137.23.1783409681711; Tue, 07 Jul 2026
 00:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706181429.264791-3-manuelebner@mailbox.org>
In-Reply-To: <20260706181429.264791-3-manuelebner@mailbox.org>
From: Yehezkel Bernat <yehezkelshb@gmail.com>
Date: Tue, 7 Jul 2026 10:34:23 +0300
X-Gm-Features: AVVi8Ce3oNTa_0Utv4RmJYoO1RWlSx8qCKfj9t6STEcdzl3r6UbwMGHukNJ09HE
Message-ID: <CA+CmpXtP1QuiQ7ZJXW=ceC0+Qidmc6kYwTfRmc6L4nDma_zn1A@mail.gmail.com>
Subject: Re: [PATCH] docs: admin-guide: thunderbolt: fix sentence structure
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajmohan Mani <rajmohan.mani@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 9:25=E2=80=AFPM Manuel Ebner <manuelebner@mailbox.or=
g> wrote:
>
> Replace ')' with ',' and add 'is' to sentence.

s/is/in/
