Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAC23A4520
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785494; cv=pass; b=PcQPADQ+lCtC9WBNLrpJAuU/xSoHwUsFIem4HSHa3lEL4uNzk8Typdtfz6nsvFPyCKQ0t/dv21BMoPjm/3APqQZXWiFmUxahQ6ji0Btv2UmCXljTu/HIXMn0XZkBJq4rqUwVSLJHU8JEPohCxhCHAPnUEpq9rUEFLBObfPfogIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785494; c=relaxed/simple;
	bh=F/LbjmUpjZiiDq4qw+y/SukWOI/qnSsQRidGKnAerWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6sYm05EAZ90APuUGJ9mq2MnJzIY95cuosA71eg/aM2LC7bUevT6YU+l22L5OwacDMxbVdQwhAccikxqJEEZfRbwDrZslBw4mG4t0krtz69VzXL4cI8kIgbqiletRW2jbo0RdiW4j6gCj4JQcsDyh2HLHiF4erzG6YSwQcU9IIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPO8fMaO; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPO8fMaO"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8000e21f014so5785027b3.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 05:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781785492; cv=none;
        d=google.com; s=arc-20240605;
        b=Ya5nHHsq/ylbi0ZVlkKEBswBtM0wrjcvaXss3oZ/PqPfxw7wduWzSdc0TOEei7i8P1
         ebSyVERgEUKiEpnnAu8rYTmqEXSJsD+fMVRPvGhwiEZ07Ciowi0YVaU2fcfH/5dc2f2u
         GOEdXgDa1Omk1gGff1IFTEjEF7cDdIOGGcpE2Ow5gj0hQaooRrW4ZbUi/ERBI2E3VYd5
         G/7jCYyzP7Rib7O8ENo4tEmcBa2zmvMoa0oioWN66Pe9VC573wgXjKgLFZ8YvnVB0UwJ
         l5RmShjCRY3XikbpZD9LPNMMVbDaGNeLci6G8D9Fes6c9u3g2T8BOp4LznQq6wA6hm8k
         w7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F/LbjmUpjZiiDq4qw+y/SukWOI/qnSsQRidGKnAerWM=;
        fh=g/8/BZ5dgYem6uYnN4x9Lf/yGWKNFEdmOkjhId0B/bU=;
        b=LFIE13RVKeyYn/JR47aGbDi3s7zHbuhV4QQ92QDo0fxqDzZjdFFkmfpvc2DCWC0pGQ
         k4/9gGDWWpffEmjrqy/pbxpGkBPHesvvuTLcR9QQyKP1CqoDVEPOwiu2u6muKTVS9AwX
         hXtwbnOguScoI5vZdPAN/b8ec8uuyQ/lF/0W66sV9aV+mxB/EdSlLlkk/+56fz9+Rixl
         VDPe3i9znIz2Ep7D8s9M24vUAlbEApXOJm4sWxBqoUOdECDMQR2j6MRVcmeX1UePQot7
         R85i6wzVBQ7E1K1S2NzfernE5Z3D87n8PGXGftMWYy68hDGNpOvdaNS/Wy59+c2IXMwa
         husA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781785492; x=1782390292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F/LbjmUpjZiiDq4qw+y/SukWOI/qnSsQRidGKnAerWM=;
        b=JPO8fMaOK7RZhUJ5SKL520sRXyyjgX99QQvs7jJI6eftB1nNzlG5wvJCsDpbmClnKl
         fzT+amFf/DuEtD6iGM7QY4YvPRZrOCwbJDDjB/iGY6JhvfhJrrUxfoh+3QoJohK3x2a8
         2opCSvWEvv8r8oPpcpvlLNNKRFNxiY88s//I0ea6RqOaVjKTaVgvkJu0ucludd3/cG4w
         hJ8Xwq3EVx8eEJ34pFeywQJYcsr1eX9fCkyJhzHuc3wMisM5bAtZnJ2UPvRQvzlCSsSf
         xNT5GYeNFHvdMo5iIPNdQOJLyGjZVvjPTiS8PkP2jGLO7d35cAsENpt6pbIe2oP2t5Ks
         2C0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785492; x=1782390292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/LbjmUpjZiiDq4qw+y/SukWOI/qnSsQRidGKnAerWM=;
        b=kvH/RuducV4S7Kun+Heo9GJX2MDADBkqakQ/mXbdEBSEj/JaGXDftTRDXO50aHq4BM
         JPhlnPQ76G7lhoVMqj3EyiG7dofCJTJurl8VwuZExrqc1dRrUyqnh/mvoAs3abwgbno8
         9DdzpmMU3WYq9ASsN6lH2Qld9sWU+VvULrVPMOTCab2fKQnUpMxM1rWFLVVQpgGUhd0v
         cNaDMulUpOHMvtODkqMHwsWpGLTyinpEAu6wHj1rezIEg4FpMQoXj2KD7RWErj3yIGgl
         8SVFPxiclg85pB1pWYG+ei6t70ObHRA5St1xij/e2AK9kBi+AA5Dcte55iGOHPfoeCV2
         DX5A==
X-Forwarded-Encrypted: i=1; AFNElJ9cfZpBpSSfjfXd6dNtEcZ6axnfugcl/z0kd5gJm2fCJXuAa746bjLVO9eGLWXB+42jn9hldjpiLAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YypyAroEBmgmo6LgxITaK+KShzhs/BD20KJnX5IJ24GGiasO0iC
	u3GwiZl02mRRfQzMQ5ZrO8FtoxHmQqz0nULI38GH94zy8vORDdr01F2e/3/VY4UvPWOZoeCOeBz
	ZoUcEsQxgHBdxFDosN4Adr/dMbASbqfg=
X-Gm-Gg: AfdE7cmOkAn/dH1VLM1P7ycLvlUuMeBz1AjrxMsw/fK6Y3ws6hKvdJGJTnIjNn1HX9I
	/22rfrxExX7Xqb4rtnauxOqIA4iGLyhCBtqcQmqkbqnMguS4495FCPqqsagTeWeK2TNfIU73l+B
	gwxWTRlp0HrtIqZQ8G1LlY+0u15LReBdQTHh2sl6mROkZcqc3O3JgsfCg8rEXe3Lh/dYH+pHjEU
	X4E2FssaW9pa3BkCMiWBXE7g3SxFGXr9wFbROoeLWSj1kMXEl9FPxf/iTv844kU6UeadJZaHKsH
	tGp3xqe6tw==
X-Received: by 2002:a05:690c:ecc:b0:7bf:424:bf6b with SMTP id
 00721157ae682-7ffc564332cmr35464057b3.14.1781785492177; Thu, 18 Jun 2026
 05:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618104633.3405705-1-zzzccc427@gmail.com> <b39be4f6-e63a-43c3-9903-e4e6e0a85cd3@kernel.org>
In-Reply-To: <b39be4f6-e63a-43c3-9903-e4e6e0a85cd3@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 18 Jun 2026 20:24:40 +0800
X-Gm-Features: AVVi8CfAETxQyYmH3rRfqOECzWT_WYi84LAnKNLka3kkP49rD0HQI4EoV1BHgU4
Message-ID: <CAFRLqsXdz6+3fvkamEHtjLHpLdWN_ffKXHgbipr16s8EV5-BBA@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: usbio: fix disconnect UAF in client teardown
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi, Hans

> Why I see no reason to delete the list node here ?

Thanks a lot for your review. You are right, the list_del_init() is
not needed for fixing this.

I'll send a v2 dropping the list_del_init() and update the commit message
accordingly.

Best regards,
Cen Zhang
