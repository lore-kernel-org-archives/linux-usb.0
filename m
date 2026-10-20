Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499995;
	b=UeaG2tSQYzItgsUsli3iKQP9HgYbtRaB09AXNP5cegHrJklWcK6CF7aEmETeByC2aNpf
	 wVqbMVUqJdaYbryclZMgXDHIWzp+5YiTF0K4jKyL+oz3Sq+gYqz1Czw9Itn9TMk+n0P8R
	 8YnugsjtT74Q5+S6EaXFwb16L/JLbj4vTX5SGdG6Nh/Su/JgFmThKXFBZmZTK6XEAye2n
	 Yozyi/cLPEnryg1A7UqBJcKsNH7AcSaLDGWcbgTkI94MxRpHIhEry4IUQF4gFF3+lGE51
	 i9F8ECfHPS9svCF/iKHK1YddNfCv+/dx3xRoclDwoaw3rB0VXzvlzLsrHJecWfyMoUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
	b=SxhRPCQGHebAPFsESawRPG1xvL/ySER0JjSneyEsFmwHz/p8bC0+9RCoHGM5ibuL+hwS
	 uK1VGdIvdT5i28hWQrxwS0VDHM0HUeN1QKK9klWOsOu84X/6rTFzo1rmBn9oZDaSo6I1J
	 ndmOoEMWHVgoct4YCNGd5eJhsgADSEWUiBHUGMI5/x+1wC4necGrZH/LZ73AuFoHhHksP
	 IBvaUKsMy24YBKL6V58rbxAGA7+XhdkW/p0mJ6AFkzMfY3t/Ife7Sn+oyz7vRKIDtuyQR
	 7evlj/VoqJtIv9PwIJiq9BcKRHG/BriyBnn2/GavkP0QGRI0d8cV4wdsd4ebypXIvaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gckgA8by;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC60E606A31A
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC60E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gckgA8by
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1834098f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 05:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499988; cv=none;
        d=google.com; s=arc-20260327;
        b=BtKb7uT6lsduYSTxY4xFftxmvpP7uZWzIWAjoFqI0PGybfvsMBS9Epj6iBoFYf03TD
         rL0jL2RRJEceH/RsjRrW95ElXwg5DNqKHkI+pKYHGs9tEq6v4XDPQoh7r7iIw8DIMtVx
         jv8VYjvc9U+rpca5W1ChxGrLDwQczZ5vqzKPG+bzVDzTtsfgV4zgosei+Jfs93icxQbV
         Ynz5mOzqzUd5bS2XytAmQvxFVD6bBDgKKvaqmHSWez7xW1VAZo4gDzR4cuo/bl8DcmC+
         Bn/QBUx345NuhfoD3+ha2OQj65YDCbEoE/GZdG6WJTEGASVnN4J1Acukmf3Ebq2wdt9P
         uZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
        fh=pCzwVPomkcMg6xSZLZLWwyItbXtT1G3T/iYwRZluEEc=;
        b=hZfJF4MCuSocvRCkZWQMHBpytoEFFdqoUUjufNWrDJYu82K4EIuWpL/1KP/hhA7eNH
         gowa8+Nizj2KdrkJNI/IVzgzERHo9yNLhFFZ1zVFhAVRDQKIDrU2HJpq7hILm/m4tlFt
         ZgCEGBcwF0mZ8SAgnG5XbuoH+Up7WTzwqHUkLV55+LBu6bmHklRbH2knwgFUkGyZR0TG
         7HZOjiMZaWAWK5e0FGPY48pOcE4OhEoXiF45zjWH1yJFxAI3z5W3jRnP82Z90kWqZGuN
         cvSEZrxcSGry5Y+C78WD7NDL8kSDSYek0jPSJ8QMc5kEb8ObB4Ug1Poqn/tRBQmSpEUl
         Nxlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499988; x=1793104788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
        b=gckgA8byjsGEdVN8Oe89vE/KvG+6bqzWUIfTn8joJ2MQKIZ/t1PNErPtmh9OMAn3vC
         P3eKQmb+TvnrYRWdfSArFZDfukjYzv85mZWJWq9dWaG82DFfJowJo/MZxMttJ2kJjLys
         53CbLDxXimjFQpc4ybWTbYWQ1PHhDweE4odPk0bAyytyCvQXygxtbucjPnonKjYpgD3s
         ohFbDFbampKm/vVXv3FUy+1qzb+8QxK+Qu7yMV4dJ5xU24dVnjmPhO9v6MoCxSbJEKnL
         A/v0+5v2iqiQJL7lcDUjoV7ktIFPiFWO+zzyXKi3gXQakae7FAnBHpUF09dIr5/QUShA
         1CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499988; x=1793104788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mn+KPT7PNe9VT7UdlFzXBdv0pr1VqYLkw7yXQZOMxLw=;
        b=DhxEHhhvW9VgDMAqDlYjspvKayV416OIlDzmuG1nHZjE9fmBJz35Tji984mw5BY69i
         dwfRm3M9oqviG9ZwFOaqK/bp4f9vkZdvfU57zLB06KbZ2zdtgZeyrDgyadGFD09vDYSV
         JrQHogYPCAMkSMSnEfJBmMAg5rWTpZClqnre2I5FchQPyLLRqgXqS3FWF1gs4NZxSkWv
         QND64HjtNDb0VSyBC4JQsKLUk3ZB7K8TY64cGWiWry3LiRAYdsrT1SRybfoNPqpAXXDp
         XHzPTOECxM6WpdK90kRyOgDHCL8wGOZ54neFWKypalJEkpyDqjz5wBtO7A/jMrC62DUs
         ZUAA==
X-Gm-Message-State: AFq9FYIXW66KFGNSNsD8tNTsyJpDfvUhxl4VhrPvc4GZH/oj3wHhd9af
	GoUo3HIwi+hRpLcOsorngwv8G8cmxxcT6ClgNGc29hLxQVD737SK1AjdEgLCJ+5Q7dQcYghM//B
	/DhHA38ZSB0jYTgxSpsF2ER26o9Jq4P8=
X-Gm-Gg: AYBFou0/7TVqrgQaMbJ1pBlTXjK+wiPRF5v++48cYOwCCHOUmgFVdvSV2EtJ7xiNbG7
	X2wtiEFCK0fPvfRek6VeuvVfchi5fcFmms9QY607lXbcGNBN6niqMX7mV0if7cm+xytKgTvEw8C
	h9F65gDxI3aKHccuYsrF3gxxLjJzZWY0JCu9l5lythpeyeNqBzZxNo7uWb4ADstsT/1m2ED9NKx
	SxZlvDaN9OPh/YOWJFCJnlmgcJilvPJZ/nJXT/hZxt6aFJf2h9jrmkz52DZZ+fiXFTMyKowecFN
	FAiWLCpxjzm2lLh/kSqLw/0+8iJ2BOfjM/h8rQNB8wvsVY9Ad3rnstsVZkdO3yMkGW4=
X-Received: by 2002:a05:6000:26d0:b0:48c:77ad:d52d with SMTP id
 ffacd0b85a97d-48e20fbffb6mr3084270f8f.43.1792499987813; Tue, 20 Oct 2026
 05:39:47 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com>
 <2026091034-slicing-same-692a@gregkh> <CAKD4hN41w_bRPAY3i9=tD1tWQLag3r-FGsngD5U6igM=FWe-_Q@mail.gmail.com>
 <2026102052-stretch-craftily-e3f8@gregkh>
In-Reply-To: <2026102052-stretch-craftily-e3f8@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Tue, 20 Oct 2026 17:39:34 +0500
X-Gm-Features: AclHuK8QNNfi9bQ6Wl4hOpfhwScE0HF214wRGBmecZbXX8hu2QyD6SP0CGAeWSI
Message-ID: <CAKD4hN5mFTS6OyYjDdWjDs1b2Y99-FZCGd4AkXhEOZ-gF94Ovw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Apologies for the confusion, As a first-time contributor, I am still
familiarizing myself with the patch submission workflow.

I have addressed all of your comments in the v2 patch, which was sent
as a separate thread. Please review the updated version here:
https://lore.kernel.org/all/20260910105359.12915-1-syedtayyabfarooq08@gmail=
.com/

Thanks,
Tayyab

On Tue, Oct 20, 2026 at 4:39=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 20, 2026 at 03:49:29PM +0500, Syed Tayyab Farooq wrote:
> > Hi,
> >
> > I wanted to follow up on this patch, if anyone has had a chance to revi=
ew it.
>
> It seems you ignored my review comments on it?
