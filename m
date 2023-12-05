Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id D5B0AAC
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 10:21:37 -0800 (PST)
Received: (qmail 425651 invoked by uid 1000); 5 Dec 2023 13:21:37 -0500
Date: Tue, 5 Dec 2023 13:21:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, erosca@de.adit-jv.com, tj@kernel.org,
  paulmck@kernel.org, Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH 1/2] usb: hub: Replace hardcoded quirk value with BIT()
 macro
Message-ID: <6071af53-e3a0-4394-a51b-81db562d0940@rowland.harvard.edu>
References: <20231205181829.127353-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205181829.127353-1-hgajjar@de.adit-jv.com>

On Tue, Dec 05, 2023 at 07:18:28PM +0100, Hardik Gajjar wrote:
> This patch replaces the hardcoded quirk value in the macro with
> BIT().
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
