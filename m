Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.222.135.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430952;
	b=AdLXozmEA0haqnzaaIcmuRu2gnc4TJVKD98wtlRbo73IS/cEDV/M6+Jus7d4ztvFqvae
	 HRYS6wkCIzKFg4ctXgLA8fKgHxymf4wjW+eKsqm3vTyYOlkKxQ/jVuMrZfKDvFBIihqKD
	 MwbtB02/zBjwlr4lgiz04RvfunxfUhXbP8Iy8v03RoNy5Uyt/zBveLlnFnlPqLsPU/Dh6
	 vFTw9Ww4IdOIFIuPVGynzm2Iy65ACXKsfmEfriMWGMUxpqy9HeOT93yZJZ8/7Z0HhzXSU
	 KsNA9XVtXotHJPfPyDNgiI+2FW4XES+bufbblpAHvlXJf9i78lQgxRdzJ44ruEB7MRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=NnKMOUjGKjB1jl9vC0qG424C5mfSoixb+3c+EDk86V0=;
	b=db7/3xdIEKqUosWskI7jdGkDXMVyw2+ughM6Ux4gjQvQyoGymFQk+F0kxDpxmf1qINiP
	 3rw8qmPOsofok0eahfFYXhUTS/6aUYUjN97iAHe4magndvX75aPNKCak+GNFmPY+7gsP5
	 +DBeXO5ve779Io2De4rFQH40YLi4SNd6fj55wMvPO9hUVd2BFcvf2bEda9YpETetZFGfz
	 b+NgyPFV08LcgMYjNLLbsiWA79hb+eJJ8Gesccp0MsdGJyw54kgqQ9orf7Y9upy+HTDYW
	 6M5q3vgoz7ihJvM2V6m3k0w8hF9+M6PdORKTDvYfS59aq4eicH8jVRV/azZ732DKyXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=o2.pl;
	spf=pass smtp.mailfrom=o2.pl;
	dkim=pass header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=Cs7+Cd78;
	arc=none smtp.remote-ip=193.222.135.158
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41015606A32C
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41015606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=Cs7+Cd78
Received: (wp-smtpd smtp.tlen.pl 45574 invoked from network); 23 Nov 2026 11:48:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=s20261001;
          t=1795430933; bh=NnKMOUjGKjB1jl9vC0qG424C5mfSoixb+3c+EDk86V0=;
          h=Subject:To:Cc:From;
          b=Cs7+Cd78QlEMaDrTAW2rU2ayA/oBmrCBH+PDzyJ0QjOfXYd0H6scLM+eGeD0nCySD
           Qz+iYpSrxaQbuR/fkLbLMsBAPkN2B1UKYsjthyjAfYdrrgFGYiqwWWvx0DX8q+gQcC
           fjj5Q3VTaD+UVRDhHW6zPYTTqPCq6Rqdsjzknbx9zfCmyRi3xD4z8Xa/r+MvPwtZn9
           jI8Pu3fjk8jUroRdjcfCcXzaUfm9ulLHi/XURdWHQ8A51fIFUZA4+dtXmMFBKz8VFf
           5xWkhAj8KdCHbwIlU7Hlomoq9DdLPx49uuT0aLybmMKa3iitBAPMbR9BZLdlGqWdaF
           EfjirfeFHLESg==
Received: from [192.168.1.22] (apn-78-30-78-152.dynamic.gprs.plus.pl [78.30.78.152])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <oneukum@suse.com>; 23 Nov 2026 11:48:53 +0100
Message-ID: <52a233cb-1671-431c-8c14-7757ca947aa5@o2.pl>
Date: Mon, 23 Nov 2026 11:48:49 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 ata_passthrough_disabled
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
 <68f6376d-a0cf-4f87-9cbb-0afb7b8536d4@suse.com>
Content-Language: en-GB, pl
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <68f6376d-a0cf-4f87-9cbb-0afb7b8536d4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 7922d71e5996639172688754da6e67d6
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [kcNU]                               

W dniu 23.11.2026 o 09:27, Oliver Neukum pisze:
 > On 21.11.26 16:52, Mateusz Jończyk wrote:
 >> The uas driver blocks access to ATA passthrough commands for some
 >> devices it considers buggy. However, it does not expose any meaningful
 >> information whether the command was disabled by the driver or is
 >> genuinly not supported by the hardware. This creates a problem for the
 >> smartmontools program and makes it difficult for it to provide a useful
 >> error message.
 > Hi,
 >
 > thank you for handling this. One thing though. This requires putting
 > the emit code into every driver. Can we centralize that somehow?

Not really, short of moving the handling of the ata_passthrough_disabled
attribute into the middle SCSI layer (which would also likely involve
moving the whole of US_FL_NO_ATA_1X logic from uas_queuecommand_lck()
there). Is this what you mean?

This attribute is really specific to the USB drivers, but it lives in
different fields in the UAS and mass storage drivers.

Greetings,
Mateusz
