Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 188701A4
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 08:45:37 -0800 (PST)
Received: (qmail 253173 invoked by uid 1000); 30 Nov 2023 11:45:36 -0500
Date: Thu, 30 Nov 2023 11:45:36 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: return type of usb_endpoint_maxp()
Message-ID: <f84e4301-4c05-4535-976e-50785de778e9@rowland.harvard.edu>
References: <802913d7-88d8-42cc-a775-493a7a426882@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <802913d7-88d8-42cc-a775-493a7a426882@suse.com>

On Thu, Nov 30, 2023 at 12:31:05PM +0100, Oliver Neukum wrote:
> Hi,
> 
> looking at usb_endpoint_maxp() it seems odd to me that
> the return type is a _signed_ integer. Is that a deeper
> secret or just defaulting to "int"?

Just the default, no deeper meaning or reason.  It hardly matters, 
since the values range only between 0 and 2047.

Alan Stern
