Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457FD175A7D
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775540334; cv=none; b=kloFtuMfFOIAohpL46H3wkNaiFc95xqKoPNheBzDFE0f/Yk+J1QB+V8cAQ4xzvFVs6ejmg+fPOq99uM1qLJ0eOYj7A9DsDQM44O3VveS+PEWaDyFBHnrlTA5dcox+C7hgGVZf5QFvr9pbfZIE5Ig47IZddKmxTCOyUW0Fk1L3Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775540334; c=relaxed/simple;
	bh=SQS0j4bFXAg6V7DEldcBNXpXWdJe2jLe9AoEAhGBFhU=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=hziEMvlsGV+IEnnkaISOB7tCULWWbrj7WQ4Bk4q2dm9gwXssrn+4fYv7qDoG3dbNHyAdDADd+ywU5d4arLXM1vKONG5pTg06gAg4pZCHRN0vNN/ztPxUfZ85Q3pNOs+FauOaD8F0gga2CmyH91lElLrKwh1Lz2+iURnIUZHegKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Aus3ZgIq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=do3UNubu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Aus3ZgIq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=do3UNubu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Aus3ZgIq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="do3UNubu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Aus3ZgIq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="do3UNubu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 619304E2B3;
	Tue,  7 Apr 2026 05:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775540331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=KrdsH8fivPt4Wyfe88kM5T4vfhvhhpfE24O1LZ7j4/c=;
	b=Aus3ZgIqhHgNiHCLVvo+5HV9tMyAeJcLEhJhrq58SdOkGQ4CvA6O/LJKtSawqBO8MXyids
	8NIoHxC0RDYkv66K6Fsfaw54s0/h//N/A+N9zlEkomfvTc+a2ixTqeKhBHwgv6XZyLpBVN
	7GsX+J3d3jnMe14YPjpoQ1UxHYvdERY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775540331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=KrdsH8fivPt4Wyfe88kM5T4vfhvhhpfE24O1LZ7j4/c=;
	b=do3UNubucu9LPs9UjEAIWQGTElrFvVjBd+BhF/24/1lYUAkVPyoPBbGMjhHsi7yZUfpp3L
	pqZgBDz9BMTlu4DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Aus3ZgIq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=do3UNubu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775540331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=KrdsH8fivPt4Wyfe88kM5T4vfhvhhpfE24O1LZ7j4/c=;
	b=Aus3ZgIqhHgNiHCLVvo+5HV9tMyAeJcLEhJhrq58SdOkGQ4CvA6O/LJKtSawqBO8MXyids
	8NIoHxC0RDYkv66K6Fsfaw54s0/h//N/A+N9zlEkomfvTc+a2ixTqeKhBHwgv6XZyLpBVN
	7GsX+J3d3jnMe14YPjpoQ1UxHYvdERY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775540331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=KrdsH8fivPt4Wyfe88kM5T4vfhvhhpfE24O1LZ7j4/c=;
	b=do3UNubucu9LPs9UjEAIWQGTElrFvVjBd+BhF/24/1lYUAkVPyoPBbGMjhHsi7yZUfpp3L
	pqZgBDz9BMTlu4DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 331864A0B0;
	Tue,  7 Apr 2026 05:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oUfECmuY1GnQZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Apr 2026 05:38:51 +0000
Date: Tue, 07 Apr 2026 07:38:50 +0200
Message-ID: <875x63gwid.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
    Nathan Rebello <nathan.c.rebello@gmail.com>,
    Heikki Krogerus <heikki.krogerus@linux.intel.com>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Spurious errors "ucsi_acpi USBC000:00: bogus connector number in CCI: 1" on 7.0-rc7
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com,linuxfoundation.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 619304E2B3

Hi,

since 7.0-rc7, I'm getting a few errors
  ucsi_acpi USBC000:00: bogus connector number in CCI: 1
at boot of Thinkpad T14s Gen 6 AMD with a dock.

Obviously this came from the commit d2d8c17ac01a ("usb: typec: ucsi:
validate connector number in ucsi_notify_common()"), and reverting it
made it gone away.  I didn't notice anything practically broken either
before or after the revert, though -- the USB devices connected on the
dock keep working, at least.

Is this a firmware bug, or some missing piece in the code?
Judging from the message, it means that ucsi->cap.num_connectors is 0,
I suppose.


thanks,

Takashi
